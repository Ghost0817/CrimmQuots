<?php

namespace AppBundle\Entity;

use Doctrine\ORM\EntityRepository;

class TopicsRepository extends EntityRepository
{
	public function findByTopTen()
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('t')
            ->from('AppBundle:Topics', 't')
            ->where('t.hits != 0')
            ->orderBy('t.hits', 'ASC')
            ->setMaxResults(8)
        ;
        $result = $qb->getQuery()->execute();

        return $result;
    }

    public function findByTopEighteen()
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('t')
            ->from('AppBundle:Topics', 't')
            ->where('t.hits != 0')
            ->orderBy('t.hits', 'ASC')
            ->setMaxResults(17)
        ;
        $result = $qb->getQuery()->execute();

        return $result;
    }
}