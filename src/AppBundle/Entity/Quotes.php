<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Quotes
 *
 * @ORM\Table(name="quotes", indexes={@ORM\Index(name="author_id", columns={"author_id"})})
 * @ORM\Entity
 */
class Quotes
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
     * @ORM\Column(name="quote", type="string", length=255, nullable=false)
     */
    private $quote;

    /**
     * @var string
     *
     * @ORM\Column(name="image", type="string", length=255, nullable=false)
     */
    private $image;

    /**
     * @var string
     *
     * @ORM\Column(name="keywords", type="string", length=255, nullable=false)
     */
    private $keywords;

    /**
     * @var \AppBundle\Entity\Authors
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Authors")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="author_id", referencedColumnName="id")
     * })
     */
    private $author;



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
     * @param string $quote
     * @return Quotes
     */
    public function setQuote($quote)
    {
        $this->quote = $quote;

        return $this;
    }

    /**
     * Get quote
     *
     * @return string 
     */
    public function getQuote()
    {
        return $this->quote;
    }

    /**
     * Set image
     *
     * @param string $image
     * @return Quotes
     */
    public function setImage($image)
    {
        $this->image = $image;

        return $this;
    }

    /**
     * Get image
     *
     * @return string 
     */
    public function getImage()
    {
        return $this->image;
    }

    /**
     * Set keywords
     *
     * @param string $keywords
     * @return Quotes
     */
    public function setKeywords($keywords)
    {
        $this->keywords = $keywords;

        return $this;
    }

    /**
     * Get keywords
     *
     * @return string 
     */
    public function getKeywords()
    {
        return $this->keywords;
    }

    /**
     * Set author
     *
     * @param \AppBundle\Entity\Authors $author
     * @return Quotes
     */
    public function setAuthor(\AppBundle\Entity\Authors $author = null)
    {
        $this->author = $author;

        return $this;
    }

    /**
     * Get author
     *
     * @return \AppBundle\Entity\Authors 
     */
    public function getAuthor()
    {
        return $this->author;
    }
}
