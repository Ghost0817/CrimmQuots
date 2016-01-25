<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints\DateTime;

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
}
