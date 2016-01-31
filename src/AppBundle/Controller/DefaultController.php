<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints\DateTime;
use AppBundle\Entity\Topicshits;
use AppBundle\Entity\Authorshits;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->render('default/index.html.twig', array(
            'base_dir' => realpath($this->getParameter('kernel.root_dir').'/..'),
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
        ));
    }

    /**
     * @Route("/quotes/topics/{slug}.{_format}", name="onetopicpage")
     */
    public function onetopicAction(Request $request, $slug)
    {
        $topics = $this->getDoctrine()
        ->getRepository('AppBundle:Topics')
        ->findOneBy(array('slug' => $slug, ));

        if (!$topics) {
            throw $this->createNotFoundException('The topic does not exist');
        }

        # get ip address
        $ip = $request->getClientIp();

        $mycount = $this->getDoctrine()
        ->getRepository('AppBundle:Topicshits')
        ->findOneBy(array('topic' => $topics, 'ip' => $ip));

        $topicshits = new Topicshits();
        if($mycount){
            # valid record;
        } else {
            $topicshits->setIp($ip);
            $topicshits->setCreateAt();
            $topicshits->setTopic($topics);
            $em = $this->getDoctrine()->getManager();
            $em->persist($topicshits);
            $topics->setHits($topics->getHits() + 1);
            $em->persist($topics);
            $em->flush();
        }

        // replace this example code with whatever you need
        return $this->render('default/onetopic.html.twig', array(
            'topics' => $topics,
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
            'authors' => $authors
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

        if (!$author) {
            throw $this->createNotFoundException('The author does not exist');
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
            'author' => $author,
            'quotes' => $quotes,
            'total_page' => $total_page,
            'page' => $page
        ));
    }
}
