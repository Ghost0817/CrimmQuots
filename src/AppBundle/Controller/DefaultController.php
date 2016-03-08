<?php
# 1 - home, 2 - author ,3 - topics,4 - quotes of the day,5 - pictures,6

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints\DateTime;
use AppBundle\Entity\Topicshits;
use AppBundle\Entity\Authorshits;
use AppBundle\Entity\Nationalityhits;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        
        $topics = $this->getDoctrine()
            ->getRepository('AppBundle:Topics')
            ->findByTopEighteen();
        
        $authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByTopEighteen();

        $homepic = $this->getDoctrine()
            ->getRepository('AppBundle:Quotes')
            ->findByPicHome(2);

        $date = new \DateTime();

        # todo: rank-aar ne shvvj xaryylax
        $query = $em->createQuery(
            "SELECT p
            FROM AppBundle:Authors p
            WHERE p.born LIKE :date"
        )->setParameter('date', '%'.$date->format('-m-d') );
        $birthdays = $query->setMaxResults(5)->getResult();

        // replace this example code with whatever you need
        return $this->render('default/index.html.twig', array(
            'topics' => $topics,
            'authors' => $authors,
            'birthdays' => $birthdays,
            'homepic' => $homepic,
            'menu' => '1'
        ));
    }

    /**
     * @Route("/quotes/topics.{_format}", name="topicspage")
     */
    public function topicsAction(Request $request)
    {
        $topics = $this->getDoctrine()
        ->getRepository('AppBundle:Topics')
        ->findAll();

        if (!$topics) {
            throw $this->createNotFoundException('The product does not exist');
        }

        // replace this example code with whatever you need
        return $this->render('default/topics.html.twig', array(
            'topics' => $topics,
            'menu' => '3'
        ));
    }

    /**
     * @Route("/quotes/topics/{slug}{page}.{_format}", 
     * name="onetopicpage",
     * defaults={"page": "1"},
     * requirements={"page": "\d+"}
     * )
     */
    public function onetopicAction(Request $request, $slug, $page)
    {
        $topics = $this->getDoctrine()
        ->getRepository('AppBundle:Topics')
        ->findAll();

        $topic = $this->getDoctrine()
        ->getRepository('AppBundle:Topics')
        ->findOneBy(array('slug' => $slug, ));

        if (!$topic) {
            throw $this->createNotFoundException('The topic does not exist');
        }
        if (!$topics) {
            throw $this->createNotFoundException('The topics does not exist');
        }

        # get ip address
        $ip = $request->getClientIp();

        $mycount = $this->getDoctrine()
        ->getRepository('AppBundle:Topicshits')
        ->findOneBy(array('topic' => $topic, 'ip' => $ip));

        $topicshits = new Topicshits();
        if($mycount){
            # valid record;
        } else {
            $topicshits->setIp($ip);
            $topicshits->setCreateAt();
            $topicshits->setTopic($topic);
            $em = $this->getDoctrine()->getManager();
            $em->persist($topicshits);
            $topic->setHits($topic->getHits() + 1);
            $em->persist($topic);
            $em->flush();
        }

        $pageshow = 27;
        $quotes = $this->getDoctrine()
        ->getRepository('AppBundle:Quotes')
        ->findByTopic($topic->getName());
        // to get just one result:
        // $product = $query->setMaxResults(1)->getOneOrNullResult();

        $total_page= ceil( count($quotes) / $pageshow);

        $quotes = $this->getDoctrine()
        ->getRepository('AppBundle:Quotes')
        ->findByTopicPage( $topic->getName(), $pageshow, $page - 1);

        // replace this example code with whatever you need
        return $this->render('default/onetopic.html.twig', array(
            'topics' => $topics,
            'topic' => $topic,
            'quotes' => $quotes,
            'total_page' => $total_page,
            'page' => $page,
            'menu' => '3'
        ));
    }

    /**
     * @Route("/quotes/keywords/{slug}{page}.{_format}", 
     * name="onekeywordpage",
     * defaults={"page": "1"},
     * requirements={"page": "\d+", "slug": "[a-z]+"}
     * )
     */
    public function onekeywordAction(Request $request, $slug, $page)
    {
        $topics = $this->getDoctrine()
        ->getRepository('AppBundle:Topics')
        ->findAll();

        if (!$topics) {
            throw $this->createNotFoundException('The topics does not exist');
        }

        $pageshow = 27;
        $quotes = $this->getDoctrine()
        ->getRepository('AppBundle:Quotes')
        ->findByKeyword($slug);
        // to get just one result:
        // $product = $query->setMaxResults(1)->getOneOrNullResult();

        $total_page= ceil( count($quotes) / $pageshow);

        $quotes = $this->getDoctrine()
        ->getRepository('AppBundle:Quotes')
        ->findByKeywordPage( $slug, $pageshow, $page - 1);

        // replace this example code with whatever you need
        return $this->render('default/onekeyword.html.twig', array(
            'topics' => $topics,
            'keyword' => $slug,
            'quotes' => $quotes,
            'total_page' => $total_page,
            'page' => $page,
            'menu' => ''
        ));
    }

    /**
     * @Route("/profession.{_format}", name="professionpage")
     */
    public function professionAction(Request $request)
    {
        $profession = $this->getDoctrine()
        ->getRepository('AppBundle:Profession')
        ->findAll();

        if (!$profession) {
            throw $this->createNotFoundException('The product does not exist');
        }
        
        // replace this example code with whatever you need
        return $this->render('default/profession.html.twig', array(
            'profession' => $profession,
            'menu' => ''
        ));
    }

    /**
     * @Route("/profession/{slug}_quotes.{_format}", name="oneprofessionpage")
     */
    public function oneprofessionAction(Request $request, $slug)
    {
        $profession = $this->getDoctrine()
        ->getRepository('AppBundle:Profession')
        ->findOneBy(array('slug' => $slug, ));

        if (!$profession) {
            throw $this->createNotFoundException('The product does not exist');
        }

        $authors = $this->getDoctrine()
        ->getRepository('AppBundle:Authors')
        ->findBy(array('profession' => $profession, ));
        
        // replace this example code with whatever you need
        return $this->render('default/oneprofession.html.twig', array(
            'profession' => $profession,
            'authors' => $authors,
            'menu' => ''
        ));
    }

    /**
     * @Route("/birthdays.{_format}", name="birthdayspage")
     */
    public function birthdaysAction(Request $request)
    {
        $cal_days = array(
            array('month' => 'January', 
            'lday' => cal_days_in_month(CAL_GREGORIAN, 1, date('Y')) ),
            array('month' => 'February', 
            'lday' => cal_days_in_month(CAL_GREGORIAN, 2, date('Y')) ),
            array('month' => 'March' ,
            'lday' => cal_days_in_month(CAL_GREGORIAN, 3, date('Y')) ),
            array('month' => 'April' ,
            'lday' => cal_days_in_month(CAL_GREGORIAN, 4, date('Y')) ),
            array('month' => 'May' ,
            'lday' => cal_days_in_month(CAL_GREGORIAN, 5, date('Y')) ),
            array('month' => 'June' ,
            'lday' => cal_days_in_month(CAL_GREGORIAN, 6, date('Y')) ),
            array('month' => 'July' ,
            'lday' => cal_days_in_month(CAL_GREGORIAN, 7, date('Y')) ),
            array('month' => 'August' ,
            'lday' => cal_days_in_month(CAL_GREGORIAN, 8, date('Y')) ),
            array('month' => 'September' ,
            'lday' => cal_days_in_month(CAL_GREGORIAN, 9, date('Y')) ),
            array('month' => 'October' ,
            'lday' => cal_days_in_month(CAL_GREGORIAN, 10, date('Y')) ),
            array('month' => 'November' ,
            'lday' => cal_days_in_month(CAL_GREGORIAN, 11, date('Y')) ),
            array('month' => 'December' ,
            'lday' => cal_days_in_month(CAL_GREGORIAN, 12, date('Y')) )
            );
        // replace this example code with whatever you need
        return $this->render('default/birthdays.html.twig', array(
            'cal_days' => $cal_days,
            'menu' => ''
        ));
    }

    /**
     * @Route("/birthdays/{date}.{_format}", name="birthdaysonpage")
     */
    public function birthdaysonAction(Request $request, $date)
    {
        $em = $this->getDoctrine()->getManager();

        # declare Months list
        $mons = array(
            "January" => "01", 
            "February" => "02", 
            "March" => "03", 
            "April" => "04", 
            "May" => "05", 
            "June" => "06", 
            "July" => "07", 
            "August" => "08", 
            "September" => "09", 
            "October" => "10", 
            "November" => "11", 
            "December" => "12"
        );
        // split get month and day
        list($month, $day) = split('[_.-]', $date);

        $searchbirthday = "%-".$mons[$month]."-".str_pad($day,2,"0",STR_PAD_LEFT);
        
        $query = $em->createQuery(
            "SELECT p
            FROM AppBundle:Authors p
            WHERE p.born LIKE :date"
        )->setParameter('date', $searchbirthday );
        $authors = $query->getResult();
        // to get just one result:
        // $product = $query->setMaxResults(1)->getOneOrNullResult();

        // replace this example code with whatever you need
        return $this->render('default/birthdayson.html.twig', array(
            'date' => $date,
            'authors' => $authors,
            'menu' => ''
        ));
    }

    /**
     * @Route("/quotes/authors/{slug}{page}.{_format}", 
     * name="quotesbyauthor",
     * defaults={"page": "1"},
     * requirements={"page": "\d+"})
     */
    public function quotesbyauthorAction(Request $request, $slug, $page)
    {
        $author = $this->getDoctrine()
        ->getRepository('AppBundle:Authors')
        ->findOneBy(array('slug' => $slug));

        $topics = $this->getDoctrine()
        ->getRepository('AppBundle:Topics')
        ->findAll();

        if (!$author) {
            throw $this->createNotFoundException('The author does not exist');
        }
        if (!$topics) {
            throw $this->createNotFoundException('The topics does not exist');
        }
        # get ip address
        $ip = $request->getClientIp();

        $mycount = $this->getDoctrine()
        ->getRepository('AppBundle:Authorshits')
        ->findOneBy(array('author' => $author, 'ip' => $ip));

        $authorshits = new Authorshits();
        if($mycount){
            # valid record;
        } else {
            $authorshits->setIp($ip);
            $authorshits->setCreateAt();
            $authorshits->setAuthor($author);
            $em = $this->getDoctrine()->getManager();
            $em->persist($authorshits);
            $author->setHits($author->getHits() + 1);
            $em->persist($author);
            $em->flush();
        }

        # start pagenation
        $pageshow = 27;
        $quotes = $this->getDoctrine()
        ->getRepository('AppBundle:Quotes')
        ->findBy(array('author' => $author));
        // to get just one result:
        // $product = $query->setMaxResults(1)->getOneOrNullResult();
        $total_page= ceil( count($quotes) / $pageshow);

        $quotes = $this->getDoctrine()
        ->getRepository('AppBundle:Quotes')
        ->findByAuthorPage( $author->getId(), $pageshow, $page - 1);
        # end pagenation

        // replace this example code with whatever you need
        return $this->render('default/quotesbyauthor.html.twig', array(
            'topics' => $topics,
            'author' => $author,
            'quotes' => $quotes,
            'total_page' => $total_page,
            'page' => $page,
            'menu' => '2'
        ));
    }

    /**
     * @Route("/nationality.{_format}", 
     * name="nationality")
     */
    public function nationalityAction(Request $request)
    {
        $nationality = $this->getDoctrine()
        ->getRepository('AppBundle:Nationality')
        ->findBy(array(),array('name' => 'ASC' ));

        return $this->render('default/nationality.html.twig', array(
            'nationality' => $nationality,
            'menu' => ''
        ));
    }

    /**
     * @Route("/nationality/{slug}_quotes.{_format}", 
     * name="quotesbynationality")
     */
    public function quotesbynationalityAction(Request $request, $slug)
    {
        $nationality = $this->getDoctrine()
        ->getRepository('AppBundle:Nationality')
        ->findOneBy(array('slug' => $slug, ));

        if (!$nationality) {
            throw $this->createNotFoundException('The nationality does not exist');
        }
        # get ip address
        $ip = $request->getClientIp();

        $mycount = $this->getDoctrine()
        ->getRepository('AppBundle:Nationalityhits')
        ->findOneBy(array('nationality' => $nationality, 'ip' => $ip));

        $nationalityhits = new Nationalityhits();
        if($mycount){
            # valid record;
        } else {
            $nationalityhits->setIp($ip);
            $nationalityhits->setCreatedAt();
            $nationalityhits->setNationality($nationality);
            $em = $this->getDoctrine()->getManager();
            $em->persist($nationalityhits);
            $nationality->setHits($nationality->getHits() + 1);
            $em->persist($nationality);
            $em->flush();
        }

        // get authors by nationality
        $authors = $this->getDoctrine()
        ->getRepository('AppBundle:Authors')
        ->findBy(array('nationality' => $nationality, ));

        return $this->render('default/quotesbynationality.html.twig', array(
            'nationality' => $nationality,
            'authors' => $authors,
            'menu' => ''
        ));
    }

    /**
     * @Route("/quotes_of_the_day_{page}.{_format}", 
     * name="quotesofday",
     * defaults={"page": "1"},
     * requirements={"page": "\d+"})
     */
    public function quotesofdayAction(Request $request)
    {
        $nationality = $this->getDoctrine()
        ->getRepository('AppBundle:Nationality')
        ->findBy(array(),array('name' => 'ASC' ));

        //lkkjhgfasdfghjkl

        return $this->render('default/quotesofday.html.twig', array(
            'nationality' => $nationality,
            'menu' => '4'
        ));
    }

    /**
     * @Route("/quotes/favorites.{_format}",
     * name="favorites")
     */
    public function favoritesAction(Request $request)
    {
        # todo: rank-aar ne shvvj xaryylax
        $a_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('a', 26);

        $b_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('b', 39);

        $c_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('c', 31);

        $d_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('d', 24);

        $e_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('e', 14);

        $f_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('f', 18);

        $g_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('g', 18);

        $h_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('h', 25);

        $i_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('i', 2);

        $j_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('j', 13);

        $k_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('k', 19);

        $l_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('l', 18);

        $m_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('m', 40);

        $n_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('n', 9);

        $o_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('o', 7);

        $p_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('p', 22);

        $q_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('q', 1);

        $r_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('r', 24);

        $s_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('s', 37);

        $t_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('t', 24);

        $v_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('v', 6);

        $w_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('w', 26);

        $y_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('y', 3);

        $z_authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findByLetter('z', 2);

        return $this->render('default/favorites.html.twig', array(
            'a_authors' => $a_authors,
            'b_authors' => $b_authors,
            'c_authors' => $c_authors,
            'd_authors' => $d_authors,
            'e_authors' => $e_authors,
            'f_authors' => $f_authors,
            'g_authors' => $g_authors,


            'h_authors' => $h_authors,
            'i_authors' => $i_authors,
            'j_authors' => $j_authors,
            'k_authors' => $k_authors,
            'l_authors' => $l_authors,
            'm_authors' => $m_authors,
            'n_authors' => $n_authors,
            'o_authors' => $o_authors,
            'p_authors' => $p_authors,


            'q_authors' => $q_authors,
            'r_authors' => $r_authors,
            's_authors' => $s_authors,
            't_authors' => $t_authors,
            'v_authors' => $v_authors,
            'w_authors' => $w_authors,
            'y_authors' => $y_authors,
            'z_authors' => $z_authors,

            'menu' => '2'
        ));
    }

    /**
     * @Route("/authors/{char}",
     * name="authors")
     */
    public function authorsAction(Request $request, $char)
    {
        # todo: rank-aar ne shvvj xaryylax
        $authors = $this->getDoctrine()
            ->getRepository('AppBundle:Authors')
            ->findBy(array('tick' => $char),array('name' => 'ASC' ));

        $paginator  = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $authors, /* query NOT result */
            $request->query->getInt('page', 1)/*page number*/,
            26/*limit per page*/
        );

        return $this->render('default/authors.html.twig', array(
            'char' => $char,
            'pagination' => $pagination,
            'menu' => ''
        ));
    }
}
