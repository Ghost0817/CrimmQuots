<?php

namespace AppBundle\Entity;

use Doctrine\ORM\EntityRepository;

class NationalityRepository extends EntityRepository
{
    public function findByTopEighteen()
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('t')
            ->from('AppBundle:Nationality', 't')
            ->where('t.hits != 0')
            ->orderBy('t.hits', 'ASC')
            ->setMaxResults(17)
        ;
        $result = $qb->getQuery()->execute();

        return $result;
    }
}