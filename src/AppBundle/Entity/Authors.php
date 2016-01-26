<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Authors
 *
 * @ORM\Table(name="authors", indexes={@ORM\Index(name="nationality", columns={"nationality"}), @ORM\Index(name="profession", columns={"profession"})})
 * @ORM\Entity
 */
class Authors
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="born", type="date", nullable=false)
     */
    private $born;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="died", type="date", nullable=false)
     */
    private $died;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="string", length=255, nullable=false)
     */
    private $description;

    /**
     * @var string
     *
     * @ORM\Column(name="body", type="text", length=65535, nullable=false)
     */
    private $body;

    /**
     * @var string
     *
     * @ORM\Column(name="slug", type="string", length=255, nullable=false)
     */
    private $slug;

    /**
     * @var string
     *
     * @ORM\Column(name="lastname", type="string", length=255, nullable=false)
     */
    private $lastname;

    /**
     * @var string
     *
     * @ORM\Column(name="firstname", type="string", length=255, nullable=false)
     */
    private $firstname;

    /**
     * @var \AppBundle\Entity\Nationality
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Nationality")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="nationality", referencedColumnName="id")
     * })
     */
    private $nationality;

    /**
     * @var \AppBundle\Entity\Profession
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Profession")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="profession", referencedColumnName="id")
     * })
     */
    private $profession;



    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set born
     *
     * @param \DateTime $born
     * @return Authors
     */
    public function setBorn($born)
    {
        $this->born = $born;

        return $this;
    }

    /**
     * Get born
     *
     * @return \DateTime 
     */
    public function getBorn()
    {
        return $this->born;
    }

    /**
     * Set died
     *
     * @param \DateTime $died
     * @return Authors
     */
    public function setDied($died)
    {
        $this->died = $died;

        return $this;
    }

    /**
     * Get died
     *
     * @return \DateTime 
     */
    public function getDied()
    {
        return $this->died;
    }

    /**
     * Set description
     *
     * @param string $description
     * @return Authors
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string 
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set body
     *
     * @param string $body
     * @return Authors
     */
    public function setBody($body)
    {
        $this->body = $body;

        return $this;
    }

    /**
     * Get body
     *
     * @return string 
     */
    public function getBody()
    {
        return $this->body;
    }

    /**
     * Set slug
     *
     * @param string $slug
     * @return Authors
     */
    public function setSlug($slug)
    {
        $this->slug = $slug;

        return $this;
    }

    /**
     * Get slug
     *
     * @return string 
     */
    public function getSlug()
    {
        return $this->slug;
    }

    /**
     * Set lastname
     *
     * @param string $lastname
     * @return Authors
     */
    public function setLastname($lastname)
    {
        $this->lastname = $lastname;

        return $this;
    }

    /**
     * Get lastname
     *
     * @return string 
     */
    public function getLastname()
    {
        return $this->lastname;
    }

    /**
     * Set firstname
     *
     * @param string $firstname
     * @return Authors
     */
    public function setFirstname($firstname)
    {
        $this->firstname = $firstname;

        return $this;
    }

    /**
     * Get firstname
     *
     * @return string 
     */
    public function getFirstname()
    {
        return $this->firstname;
    }

    /**
     * Set nationality
     *
     * @param \AppBundle\Entity\Nationality $nationality
     * @return Authors
     */
    public function setNationality(\AppBundle\Entity\Nationality $nationality = null)
    {
        $this->nationality = $nationality;

        return $this;
    }

    /**
     * Get nationality
     *
     * @return \AppBundle\Entity\Nationality 
     */
    public function getNationality()
    {
        return $this->nationality;
    }

    /**
     * Set profession
     *
     * @param \AppBundle\Entity\Profession $profession
     * @return Authors
     */
    public function setProfession(\AppBundle\Entity\Profession $profession = null)
    {
        $this->profession = $profession;

        return $this;
    }

    /**
     * Get profession
     *
     * @return \AppBundle\Entity\Profession 
     */
    public function getProfession()
    {
        return $this->profession;
    }
}
