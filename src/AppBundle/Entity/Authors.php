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
     * @var string
     *
     * @ORM\Column(name="born", type="string", length=15, nullable=false)
     */
    private $born;

    /**
     * @var string
     *
     * @ORM\Column(name="died", type="string", length=15, nullable=false)
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
     * @ORM\Column(name="name", type="string", length=255, nullable=false)
     */
    private $name;

    /**
     * @var integer
     *
     * @ORM\Column(name="hits", type="bigint", nullable=false)
     */
    private $hits;

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
     * @param string $born
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
     * @return string 
     */
    public function getBorn()
    {
        return $this->born;
    }

    /**
     * Set died
     *
     * @param string $died
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
     * @return string 
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
     * Set name
     *
     * @param string $name
     * @return Authors
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string 
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set hits
     *
     * @param integer $hits
     * @return Authors
     */
    public function setHits($hits)
    {
        $this->hits = $hits;

        return $this;
    }

    /**
     * Get hits
     *
     * @return integer 
     */
    public function getHits()
    {
        return $this->hits;
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
