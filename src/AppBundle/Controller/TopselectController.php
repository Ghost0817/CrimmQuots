<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints\DateTime;
use AppBundle\Entity\Topics;
use AppBundle\Entity\Authors;

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
}