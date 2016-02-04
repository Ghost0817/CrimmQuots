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
     * @var integer
     *
     * @ORM\Column(name="nationality_id", type="integer", nullable=false)
     */
    private $nationalityId;

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
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set nationalityId
     *
     * @param integer $nationalityId
     * @return Nationalityhits
     */
    public function setNationalityId($nationalityId)
    {
        $this->nationalityId = $nationalityId;

        return $this;
    }

    /**
     * Get nationalityId
     *
     * @return integer 
     */
    public function getNationalityId()
    {
        return $this->nationalityId;
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
    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;

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
}
