<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Collectionsquotes
 *
 * @ORM\Table(name="collectionsquotes", indexes={@ORM\Index(name="quote_id", columns={"quote_id", "user_id"}), @ORM\Index(name="user_id", columns={"user_id"}), @ORM\Index(name="coll_id", columns={"coll_id"}), @ORM\Index(name="IDX_5B8D23DBDB805178", columns={"quote_id"})})
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
     * @var \DateTime
     *
     * @ORM\Column(name="create_at", type="datetime", nullable=false)
     */
    private $createAt;

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
     * @var \AppBundle\Entity\Collections
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Collections")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="coll_id", referencedColumnName="id")
     * })
     */
    private $coll;



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

    /**
     * Set quote
     *
     * @param \AppBundle\Entity\Quotes $quote
     * @return Collectionsquotes
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
     * @return Collectionsquotes
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

    /**
     * Set coll
     *
     * @param \AppBundle\Entity\Collections $coll
     * @return Collectionsquotes
     */
    public function setColl(\AppBundle\Entity\Collections $coll = null)
    {
        $this->coll = $coll;

        return $this;
    }

    /**
     * Get coll
     *
     * @return \AppBundle\Entity\Collections 
     */
    public function getColl()
    {
        return $this->coll;
    }
}
