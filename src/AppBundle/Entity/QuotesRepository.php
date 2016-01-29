<?php

namespace AppBundle\Entity;

use Doctrine\ORM\EntityRepository;

class QuotesRepository extends EntityRepository
{
	public function findByAuthorPage( $author, $limit, $offset)
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('a')
            ->from('AppBundle:Quotes', 'a')
            ->where('a.author = :author')
            ->setParameter('author', $author)
            ->setMaxResults($limit)
            ->setFirstResult($limit * $offset)
        ;
        $result = $qb->getQuery()->execute();

        return $result;
    }
}