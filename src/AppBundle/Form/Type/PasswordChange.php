<?php
namespace AppBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

class PasswordChange extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('oldPassword', PasswordType::class, array(
                'required'    => true,
                'constraints' => array(
                    new NotBlank(),
                    new Length(array('min' => 7,'max' => 30)),
                ),
            ))
            ->add('password', PasswordType::class, array(
                'required'    => true,
                'constraints' => array(
                    new NotBlank(),
                    new Length(array('min' => 7,'max' => 30)),
                ),
            ))
            ->add('save', SubmitType::class, array(
                'label'=>'Change',
                'attr' => array('class' => 'modal-action modal-close waves-effect waves-green btn-flat'),
            ))
        ;
    }

    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Form\Model\ChangePassword',
            'csrf_protection' => true,
            'csrf_field_name' => '_token',
            'intention'       => 'task_item',
        ));
    }
}