<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Slug
 *
 * @ORM\Table(name="About")
 * @ORM\Entity
 */
class About
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
     * @var \AppBundle\Entity\Slug
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Slug")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="slug_id", referencedColumnName="id")
     * })
     */
    private $slug;

    /**
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=150, nullable=false)
     */
    private $title;

    /**
     * @var string
     *
     * @ORM\Column(name="desc", type="string", length=255, nullable=false)
     */
    private $desc;


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
     * Set title
     *
     * @param string $title
     * @return Slugs
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get title
     *
     * @return string 
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Set desc
     *
     * @param string $desc
     * @return Slugs
     */
    public function setDesc($desc)
    {
        $this->desc = $desc;

        return $this;
    }

    /**
     * Get desc
     *
     * @return string 
     */
    public function getDesc()
    {
        return $this->desc;
    }
}
