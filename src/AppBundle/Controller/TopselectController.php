<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class TopselectController extends Controller
{
	public function toptopicsAction()
    {
        $em = $this->getDoctrine()->getManager();
        $topics = $em->getRepository('AppBundle:Topics')->findByTopTen();
        $response = $this->render('top/toptopics.html.twig', array(
            'topics' => $topics
        ));
        // set the shared max age - which also marks the response as public
        #$response->setSharedMaxAge(600);
        return $response;
    }

    public function topauthorsAction()
    {
        $em = $this->getDoctrine()->getManager();
        $authors = $em->getRepository('AppBundle:Authors')->findByTopTen();
        $response = $this->render('top/topauthors.html.twig', array(
            'authors' => $authors
        ));
        // set the shared max age - which also marks the response as public
        #$response->setSharedMaxAge(600);
        return $response;
    }

    public function topnationalitiesAction()
    {
        $em = $this->getDoctrine()->getManager();
        $nationalities = $em->getRepository('AppBundle:Nationality')->findByTopEighteen();
        $response = $this->render('top/topnationalities.html.twig', array(
            'nationalities' => $nationalities
        ));
        // set the shared max age - which also marks the response as public
        #$response->setSharedMaxAge(600);
        return $response;
    }

    public function homequoteAction()
    {
        $em = $this->getDoctrine()->getManager();

        #$quote = $em->getRepository('AppBundle:Quotes')->findOneById('311332');
        $quote = $em->getRepository('AppBundle:Quotes')->findBySlideHome();

        $makefov = array();
        $fov = $this->getDoctrine()
            ->getRepository('AppBundle:Userfavorites')
            ->findOneBy(array(
                'quote' => $quote,
                'user' => $this->getUser()
            ));

        if($fov){
            $makefov = array('quoteId' => $quote->getId(), 'makeFavorite' => 1);
        }
        $response = $this->render('helper/topquote.html.twig', array(
            'quote' => $quote,
            'makefov' => json_encode($makefov),
        ));
        // set the shared max age - which also marks the response as public
        #$response->setSharedMaxAge(600);
        return $response;
    }
}