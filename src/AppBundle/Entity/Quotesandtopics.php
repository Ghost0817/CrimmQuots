<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Quotesandtopics
 *
 * @ORM\Table(name="quotesandtopics", indexes={@ORM\Index(name="quote_id", columns={"quote_id", "topic_id"}), @ORM\Index(name="topic_id", columns={"topic_id"}), @ORM\Index(name="IDX_E53EC688DB805178", columns={"quote_id"})})
 * @ORM\Entity
 */
class Quotesandtopics
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
     * @var \AppBundle\Entity\Quotes
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Quotes")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="quote_id", referencedColumnName="id")
     * })
     */
    private $quote;

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
     * Set quote
     *
     * @param \AppBundle\Entity\Quotes $quote
     * @return Quotesandtopics
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
     * Set topic
     *
     * @param \AppBundle\Entity\Topics $topic
     * @return Quotesandtopics
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
