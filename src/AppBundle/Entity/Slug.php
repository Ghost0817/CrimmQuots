<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Slug
 *
 * @ORM\Table(name="Slug")
 * @ORM\Entity
 */
class Slug
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
     * @ORM\Column(name="name_mn", type="string", length=255, nullable=false)
     */
    private $nameMn;

    /**
     * @var string
     *
     * @ORM\Column(name="name_en", type="string", length=255, nullable=false)
     */
    private $nameEn;

    /**
     * @var string
     *
     * @ORM\Column(name="slug", type="string", length=255, nullable=false)
     */
    private $slug;

    /**
     * @var integer
     *
     * @ORM\Column(name="sequence", type="integer", nullable=false)
     */
    private $sequence;

    /**
     * @var string
     *
     * @ORM\Column(name="browser_title_mn", type="string", length=255, nullable=false)
     */
    private $browserTitleMn;

    /**
     * @var string
     *
     * @ORM\Column(name="browser_title_en", type="string", length=255, nullable=false)
     */
    private $browserTitleEn;



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
     * Set name_mn
     *
     * @param string $nameMn
     * @return Slugs
     */
    public function setNameMn($nameMn)
    {
        $this->nameMn = $nameMn;

        return $this;
    }

    /**
     * Get name_mn
     *
     * @return string 
     */
    public function getNameMn()
    {
        return $this->nameMn;
    }

    /**
     * Set name_en
     *
     * @param string $nameEn
     * @return Slugs
     */
    public function setNameEn($nameEn)
    {
        $this->nameEn = $nameEn;

        return $this;
    }

    /**
     * Get name_en
     *
     * @return string 
     */
    public function getNameEn()
    {
        return $this->nameEn;
    }

    /**
     * Set slug
     *
     * @param string $slug
     * @return Slugs
     */
    public function setSlug($slug)
    {
        $this->slug = $slug;

        return $this;
    }

    /**
     * Get slug
     *
     * @return string 
     */
    public function getSlug()
    {
        return $this->slug;
    }

    /**
     * Set sequence
     *
     * @param integer $sequence
     * @return Slugs
     */
    public function setSequence($sequence)
    {
        $this->sequence = $sequence;

        return $this;
    }

    /**
     * Get hits
     *
     * @return integer 
     */
    public function getSequence()
    {
        return $this->sequence;
    }

    /**
     * Set browser_title_mn
     *
     * @param string $browserTitleMn
     * @return Slugs
     */
    public function setBrowserTitleMn($browserTitleMn)
    {
        $this->browserTitleMn = $browserTitleMn;

        return $this;
    }

    /**
     * Get browser_title_mn
     *
     * @return string 
     */
    public function getBrowserTitleMn()
    {
        return $this->browserTitleMn;
    }

    /**
     * Set browser_title_en
     *
     * @param string $BrowserTitleEn
     * @return Slugs
     */
    public function setBrowserTitleEn($browserTitleEn)
    {
        $this->browserTitleEn = $browserTitleEn;

        return $this;
    }

    /**
     * Get browser_title_en
     *
     * @return string 
     */
    public function getBrowserTitleEn()
    {
        return $this->browserTitleEn;
    }
}
