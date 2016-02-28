<?php

namespace AppBundle\Form\Model;

use Symfony\Component\Validator\Constraints as Assert;

class EditFavorite
{

    /**
     * @var string
     * @Assert\NotNull()
     * @Assert\NotBlank()
     * @Assert\Type(
     *     type="integer",
     *     message="The value {{ value }} is not a valid {{ type }}."
     * )
     */
    private $quoteId;

    /**
     * @var string
     * @Assert\NotNull()
     * @Assert\NotBlank()
     * @Assert\Type(
     *     type="bool",
     *     message="The value {{ value }} is not a valid {{ type }}."
     * )
     */
    private $makeFavorite;

    /**
     * Set quoteId
     *
     * @param integer $quoteId
     *
     * @return EditFavorite
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
     * Set makeFavorite
     *
     * @param bool $makeFavorite
     *
     * @return EditFavorite
     */
    public function setMakeFavorite($makeFavorite)
    {
        $this->makeFavorite = $makeFavorite;
        return $this;
    }
    /**
     * Get makeFavorite
     *
     * @return bool
     */
    public function getMakeFavorite()
    {
        return $this->makeFavorite;
    }
}