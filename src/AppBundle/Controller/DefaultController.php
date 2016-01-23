<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

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
        // replace this example code with whatever you need
        return $this->render('default/profession.html.twig', array(
            'base_dir' => realpath($this->getParameter('kernel.root_dir').'/..'),
        ));
    }

    /**
     * @Route("/birthdays.{_format}", name="birthdayspage")
     */
    public function birthdaysAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->render('default/birthdays.html.twig', array(
            'base_dir' => realpath($this->getParameter('kernel.root_dir').'/..'),
        ));
    }
}
