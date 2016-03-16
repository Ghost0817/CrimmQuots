<?php

namespace AppBundle\Entity;

use Doctrine\ORM\EntityRepository;

class QuotesRepository extends EntityRepository
{
    public function findByTopic( $topic)
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('a')
            ->from('AppBundle:Quotes', 'a')
            ->where('a.keywords LIKE :topic')
            ->setParameter('topic', '%'.$topic.'%')
            ->orderBy('a.id', 'ASC')
        ;
        $result = $qb->getQuery()->execute();

        return $result;
    }

    public function findByKeyword( $keyword)
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('a')
            ->from('AppBundle:Quotes', 'a')
            ->where('a.keywords LIKE :keyword')
            ->setParameter('keyword', '%'.$keyword.'%')
            ->orderBy('a.id', 'ASC')
        ;
        $result = $qb->getQuery()->execute();

        return $result;
    }

    public function findByPicHome( $limit )
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('a')
            ->addSelect('RAND() as HIDDEN rand')
            ->from('AppBundle:Quotes', 'a')
            ->where('a.image != \'\'')
            ->orderBy('rand')
            ->setMaxResults($limit)
        ;
        $result = $qb->getQuery()->execute();

        return $result;
    }

    public function findBySlideHome()
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('a')
            ->addSelect('RAND() as HIDDEN rand')
            ->from('AppBundle:Quotes', 'a')
            ->orderBy('rand')
            ->setMaxResults(1)
        ;
        $result = $qb->getQuery()->getSingleResult();

        return $result;
    }

    public function findBySlideTopicsHome($topic)
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('a')
            ->addSelect('RAND() as HIDDEN rand')
            ->from('AppBundle:Quotes', 'a')
            ->where('a.keywords LIKE :topic')
            ->setParameter('topic', '%'.$topic.'%')
            ->orderBy('rand')
            ->setMaxResults(11)
        ;
        $result = $qb->getQuery()->execute();

        return $result;
    }

    public function findBySlideAuthorHome($author)
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('a')
            ->addSelect('RAND() as HIDDEN rand')
            ->from('AppBundle:Quotes', 'a')
            ->where('a.author = :author')
            ->setParameter('author', $author)
            ->orderBy('rand')
            ->setMaxResults(11)
        ;
        $result = $qb->getQuery()->execute();

        return $result;
    }

    public function findByPictures()
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('a')
            ->from('AppBundle:Quotes', 'a')
            ->where('a.image != \'\'')
        ;
        $result = $qb->getQuery()->execute();

        return $result;
    }

}