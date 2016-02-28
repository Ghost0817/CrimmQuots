<?php

namespace AppBundle\Controller;

use AppBundle\Entity\AppUsers;
use AppBundle\Entity\Userfavorites;
use AppBundle\Form\AppUsersType;
use AppBundle\Form\Model\EditFavorite;
use AppBundle\Form\Model\ChangePassword;
use AppBundle\Form\Type\EditFavoriteType;
use AppBundle\Form\Type\PasswordChange;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
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
    public function logoutAction(Request $request)
    {
        $request->getSession()
            ->getFlashBag()
            ->add('success', 'You have logged out.')
        ;
        //return $this->redirect($this->generateUrl('homepage'));
    }

    /**
     * @Route("/users/my/account", name="accountsettings")
     * @Method({"GET","POST"})
     */
    public function accountsettingsAction(Request $request)
    {

        $entity = new ChangePassword();

        $form = $this->createForm(PasswordChange::class, $entity);

        $form->handleRequest($request);
        if ($request->isMethod('POST')) {
            if ($form->isValid()) {

                $registration = $form->getData();

                $entity = $this->getUser();

                //start Dynamically Encoding a Password
                $encoder = $this->container->get('security.password_encoder');
                $encoded = $encoder->encodePassword($entity, $registration->getPassword());

                $entity->setPassword($encoded);
                // end Dynamically Encoding a Password

                $em = $this->getDoctrine()->getManager();
                $em->persist($entity);
                $em->flush();

                $this->addFlash(
                    'success',
                    'You have changed your password.'
                );

                return $this->redirect($this->generateUrl('accountsettings'));
            }
        }

        $me = $this->getUser();

        $me->setEmail($this->secret_mail($me->getEmail()));

        return $this->render('security/settings.html.twig', array(
            'menu' => 'login',
            'form' => $form->createView(),
            'me'   => $me
        ));
    }

    /**
     * @Route("/users/favorites", name="usersfavorites")
     * @Method("GET")
     */
    public function favoritesAction(Request $request)
    {
        $me = $this->getUser();

        $topics = $this->getDoctrine()
            ->getRepository('AppBundle:Topics')
            ->findAll();

        $authors = $this->getDoctrine()
            ->getRepository('AppBundle:Userfavorites')
            ->findBy(array('user' => $me),array('createdAt' => 'DESC' ));

        $paginator  = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $authors, /* query NOT result */
            $request->query->getInt('page', 1)/*page number*/,
            26/*limit per page*/
        );

        return $this->render('security/usersfavorites.html.twig', array(
            'menu' => 'usersfavorites',
            'topics' => $topics,
            'pagination' => $pagination
        ));
    }

    /**
     * @Route("/uapi/apiEditFavorite", name="apiEditFavorite")
     * @Method("POST")
     */
    public function apieditfavoriteAction(Request $request)
    {
        $smg = "";
        if($this->getUser()) {
            $entity = new EditFavorite();

            $form = $this->createForm(EditFavoriteType::class, $entity);

            $form->handleRequest($request);

            if ($request->isMethod('POST')) {
                if ($form->isValid()) {
                    $entity = $form->getData();
                    $smg = "nothing there.";
                    if($entity->getMakeFavorite() == 'true') {
                        # TODO: favorite table deer baigaa esexiig shalgax
                        $uf = new Userfavorites();

                        $uf->setQuoteId(
                            $this->getDoctrine()
                                ->getRepository('AppBundle:Quotes')
                                ->findOneBy(array('id' => $entity->getQuoteId()))
                        );
                        $uf->setUser($this->getUser());
                        $uf->setCreatedAt();

                        $em = $this->getDoctrine()->getManager();
                        $em->persist($entity);
                        $em->flush();

                        $smg = "A quote was added to your <a href='/users/favorites'>favorites</a>!";
                    }
                    if($entity->getMakeFavorite() == 'false') {
                        $smg = "A quote was deleted from your <a href='/users/favorites'>favorites</a>.";
                    }
                } else {
                    $smg = "Data is not a valid.";
                }
            } else {
                $smg = "Request is not a valid.";
            }
        } else {
            $smg = "You are not logged in.";
        }
        new Response();
        $response = new Response();
        $response->setContent(json_encode(array(
            'data' => $smg,
        )));
        $response->headers->set('Content-Type', 'application/json');

        return $response;
    }

    public function secret_mail($email)
    {
        $prop=2;
        $start = '';
        $end='';
        $domain = substr(strrchr($email, "@"), 1);
        $mailname=str_replace($domain,'',$email);
        $name_l=strlen($mailname);
        $domain_l=strlen($domain);
        for($i=0;$i<=$name_l/$prop-1;$i++)
        {
            $start.='?';
        }

        for($i=0;$i<=$domain_l/$prop-1;$i++)
        {
            $end.='?';
        }

        return substr_replace($mailname, $start, 2, $name_l/$prop).substr_replace($domain, $end, 2, $domain_l/$prop);
    }
}