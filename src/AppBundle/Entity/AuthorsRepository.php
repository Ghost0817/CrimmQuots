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

    public function findByTopEighteen()
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('a')
            ->from('AppBundle:Authors', 'a')
            ->where('a.hits != 0')
            ->orderBy('a.hits', 'ASC')
            ->setMaxResults(17)
        ;
        $result = $qb->getQuery()->execute();

        return $result;
    }

    public function findByLetter($letter, $limit)
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('a')
            ->from('AppBundle:Authors', 'a')
            ->where('a.tick = :letter')
            #->andWhere('a.hits != 0')//todo: hits ne 0 tentsexgui baix.
            ->orderBy('a.name', 'ASC') //todo: first name opuulax.
            ->setParameter('letter', $letter)
            ->setMaxResults($limit)
        ;
        $result = $qb->getQuery()->execute();

        return $result;
    }
}