<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class AppUsersType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('username', TextType::class, array(
                'constraints' =>  array(
                    new NotBlank(),
                    new Length(array('min' => 3, 'max' => 30)),
                ),
            ))
            ->add('email', EmailType::class, array(
                /*'label_attr' => array(
                    'data-error' => 'Please enter a valid email address.',
                    'data-success' => 'right'
                ),*/
                'constraints' =>  array(
                    new NotBlank(),
                    new Length(array('min' => 3, 'max' => 30)),
                ),
            ))
            ->add('password', PasswordType::class, array(
                'constraints' =>  array(
                    new NotBlank(),
                    new Length(array('min' => 3, 'max' => 30)),
                ),
            ))
            ->add('save', SubmitType::class, array('label' => 'Sign Up'))
        ;
    }
    
    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\AppUsers'
        ));
    }
}
