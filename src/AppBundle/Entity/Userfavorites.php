<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Userfavorites
 *
 * @ORM\Table(name="userfavorites", indexes={@ORM\Index(name="user_id", columns={"user_id", "quote_id"})})
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
     * @var integer
     *
     * @ORM\Column(name="user_id", type="integer", nullable=false)
     */
    private $userId;

    /**
     * @var integer
     *
     * @ORM\Column(name="quote_id", type="integer", nullable=false)
     */
    private $quoteId;

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
     * Set userId
     *
     * @param integer $userId
     * @return Userfavorites
     */
    public function setUserId($userId)
    {
        $this->userId = $userId;

        return $this;
    }

    /**
     * Get userId
     *
     * @return integer 
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * Set quoteId
     *
     * @param integer $quoteId
     * @return Userfavorites
     */
    public function setQuoteId($quoteId)
    {
        $this->quoteId = $quoteId;

        return $this;
    }

    /**
     * Get quoteId
     *
     * @return integer 
     */
    public function getQuoteId()
    {
        return $this->quoteId;
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
}
