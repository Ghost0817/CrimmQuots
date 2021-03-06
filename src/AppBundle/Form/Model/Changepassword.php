<?php
// src/FrontendBundle/Form/Model/ChangePassword.php
namespace AppBundle\Form\Model;

use Symfony\Component\Security\Core\Validator\Constraints as SecurityAssert;

class ChangePassword
{
    /**
     * @SecurityAssert\UserPassword(
     *     message = "Incorrect old password, please try again."
     * )
     */
    private $oldPassword;
    private $password;
    /**
     * Set oldPassword
     *
     * @param string $oldPassword
     *
     * @return Admin
     */
    public function setOldPassword($oldPassword)
    {
        $this->oldPassword = $oldPassword;
        return $this;
    }
    /**
     * Get username
     *
     * @return string
     */
    public function getOldPassword()
    {
        return $this->oldPassword;
    }
    /**
     * Set password
     *
     * @param string $password
     *
     * @return Admin
     */
    public function setPassword($password)
    {
        $this->password = $password;
        return $this;
    }
    /**
     * Get password
     *
     * @return string
     */
    public function getPassword()
    {
        return $this->password;
    }
}