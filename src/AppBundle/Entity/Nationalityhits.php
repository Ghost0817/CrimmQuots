<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Nationalityhits
 *
 * @ORM\Table(name="nationalityhits", indexes={@ORM\Index(name="nationality_id", columns={"nationality_id"})})
 * @ORM\Entity
 */
class Nationalityhits
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
     * @ORM\Column(name="ip", type="string", length=50, nullable=false)
     */
    private $ip;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created_at", type="datetime", nullable=false)
     */
    private $createdAt;

    /**
     * @var \AppBundle\Entity\Nationality
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Nationality")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="nationality_id", referencedColumnName="id")
     * })
     */
    private $nationality;



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
     * Set ip
     *
     * @param string $ip
     * @return Nationalityhits
     */
    public function setIp($ip)
    {
        $this->ip = $ip;

        return $this;
    }

    /**
     * Get ip
     *
     * @return string 
     */
    public function getIp()
    {
        return $this->ip;
    }

    /**
     * Set createdAt
     *
     * @param \DateTime $createdAt
     * @return Nationalityhits
     */
    public function setCreatedAt()
    {
        $this->createdAt = new \DateTime();

        return $this;
    }

    /**
     * Get createdAt
     *
     * @return \DateTime 
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * Set nationality
     *
     * @param \AppBundle\Entity\Nationality $nationality
     * @return Nationalityhits
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
}
