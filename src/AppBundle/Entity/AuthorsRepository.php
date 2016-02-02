<?php

namespace AppBundle\Entity;

use Doctrine\ORM\EntityRepository;

class AuthorsRepository extends EntityRepository
{
	public function findByTopTen()
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('a')
            ->from('AppBundle:Authors', 'a')
            ->where('a.hits != 0')
            ->orderBy('a.hits', 'ASC')
            ->setMaxResults(8)
        ;
        $result = $qb->getQuery()->execute();

        return $result;
    }
}