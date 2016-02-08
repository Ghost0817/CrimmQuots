<?php

namespace AppBundle\Controller;

use AppBundle\Entity\AppUsers;
use AppBundle\Form\AppUsersType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;

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
        if ($request->isMethod('POST')) {
            if ($form->isValid()) {
                $newuser->setActivationkey($newuser->getActivationkey());
                $newuser->setIsActive(0);

                // strat Dynamically Encoding a Password
                $encoder = $this->container->get('security.password_encoder');
                $encoded = $encoder->encodePassword($newuser, $newuser->getPassword());
                $newuser->setPassword($encoded);

                $em = $this->getDoctrine()->getManager();
                $em->persist($newuser);
                $em->flush();

                $this->addFlash(
                    'success',
                    'Амжилттай хадгаллаа.'
                );

                return $this->redirect($this->generateUrl('homepage'));
            }
        }

        // replace this example code with whatever you need
        return $this->render('security/index.html.twig', array(
            'form' => $form->createView(),
        ));
    }

    /**
     * @Route("/login", name="login")
     * @Method("GET")
     */
    public function loginAction()
    {
        $authenticationUtils = $this->get('security.authentication_utils');
        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();
        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();
        return $this->render('security/login.html.twig', array(
            'last_username' => $lastUsername,
            'error'         => $error,
            'menu'          => 'login'
        ));
    }

    /**
     * @Route("/login_check", name="login_check")
     * @Method("POST")
     */
    public function login_checkAction()
    {
        #You have successfully logged in.
        $helper = $this->get('security.authentication_utils');
        return $this->render('security/login.html.twig', array(
            'last_username' => $helper->getLastUsername(),
            'error'         => $helper->getLastAuthenticationError(),
            'menu'          => 'login'
        ));
    }

    /**
     * @Route("/logout", name="logout")
     * @Method("GET")
     */
    public function logoutAction()
    {
        $this->addFlash(
            'success',
            'You have logged out.'
        );
        //return $this->redirect($this->generateUrl('homepage'));
    }

    /**
     * @Route("/users/my/account", name="accountsettings")
     * @Method("GET")
     */
    public function accountsettingsAction()
    {
        return $this->render('security/settings.html.twig', array(
            'menu'          => 'login'
        ));
    }
}