<?php

namespace AppBundle\Controller;

use AppBundle\Entity\AppUsers;
use AppBundle\Form\AppUsersType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;


class SecurityController extends Controller
{
    /**
     * @Route("/signup", name="signup")
     */
    public function indexAction(Request $request)
    {
        $newuser = new AppUsers();

        $form = $this->createForm(AppUsersType::class, $newuser, array(
            'action' => $this->generateUrl('signup'),
            'method' => 'POST',
        ));

        $form->handleRequest($request);


        // replace this example code with whatever you need
        return $this->render('security/index.html.twig', array(
            'form' => $form->createView(),
        ));
    }
}