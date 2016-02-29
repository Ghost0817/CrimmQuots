<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Userfavorites
 *
 * @ORM\Table(name="userfavorites", indexes={@ORM\Index(name="user_id", columns={"user_id", "quote_id"}), @ORM\Index(name="quote_id", columns={"quote_id"}), @ORM\Index(name="IDX_2A24C195A76ED395", columns={"user_id"})})
 * @ORM\Entity
 */
class Userfavorites
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
     * @ORM\Column(name="created_at", type="datetime", nullable=false)
     */
    private $createdAt;

    /**
     * @var \AppBundle\Entity\Quotes
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Quotes")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="quote_id", referencedColumnName="id")
     * })
     */
    private $quote;

    /**
     * @var \AppBundle\Entity\AppUsers
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\AppUsers")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     * })
     */
    private $user;



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
     * Set createdAt
     *
     * @param \DateTime $createdAt
     * @return Userfavorites
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

    /**
     * Set quote
     *
     * @param \AppBundle\Entity\Quotes $quote
     * @return Userfavorites
     */
    public function setQuote(\AppBundle\Entity\Quotes $quote = null)
    {
        $this->quote = $quote;

        return $this;
    }

    /**
     * Get quote
     *
     * @return \AppBundle\Entity\Quotes 
     */
    public function getQuote()
    {
        return $this->quote;
    }

    /**
     * Set user
     *
     * @param \AppBundle\Entity\AppUsers $user
     * @return Userfavorites
     */
    public function setUser(\AppBundle\Entity\AppUsers $user = null)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get user
     *
     * @return \AppBundle\Entity\AppUsers 
     */
    public function getUser()
    {
        return $this->user;
    }
}
