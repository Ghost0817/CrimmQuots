<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Topicshits
 *
 * @ORM\Table(name="topicshits", indexes={@ORM\Index(name="quote_id", columns={"topic_id"})})
 * @ORM\Entity
 */
class Topicshits
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
     * @ORM\Column(name="create_at", type="datetime", nullable=false)
     */
    private $createAt;

    /**
     * @var \AppBundle\Entity\Topics
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Topics")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="topic_id", referencedColumnName="id")
     * })
     */
    private $topic;



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
     * @return Topicshits
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
     * Set createAt
     *
     * @param \DateTime $createAt
     * @return Topicshits
     */
    public function setCreateAt()
    {
        $this->createAt = new \DateTime();

        return $this;
    }

    /**
     * Get createAt
     *
     * @return \DateTime 
     */
    public function getCreateAt()
    {
        return $this->createAt;
    }

    /**
     * Set topic
     *
     * @param \AppBundle\Entity\Topics $topic
     * @return Topicshits
     */
    public function setTopic(\AppBundle\Entity\Topics $topic = null)
    {
        $this->topic = $topic;

        return $this;
    }

    /**
     * Get topic
     *
     * @return \AppBundle\Entity\Topics 
     */
    public function getTopic()
    {
        return $this->topic;
    }
}
