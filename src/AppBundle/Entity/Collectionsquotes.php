<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Collectionsquotes
 *
 * @ORM\Table(name="collectionsquotes", indexes={@ORM\Index(name="quote_id", columns={"quote_id", "user_id"})})
 * @ORM\Entity
 */
class Collectionsquotes
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
     * @ORM\Column(name="quote_id", type="integer", nullable=false)
     */
    private $quoteId;

    /**
     * @var integer
     *
     * @ORM\Column(name="user_id", type="integer", nullable=false)
     */
    private $userId;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="create_at", type="datetime", nullable=false)
     */
    private $createAt;



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
     * Set quoteId
     *
     * @param integer $quoteId
     * @return Collectionsquotes
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
     * Set userId
     *
     * @param integer $userId
     * @return Collectionsquotes
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
     * Set createAt
     *
     * @param \DateTime $createAt
     * @return Collectionsquotes
     */
    public function setCreateAt($createAt)
    {
        $this->createAt = $createAt;

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
}
