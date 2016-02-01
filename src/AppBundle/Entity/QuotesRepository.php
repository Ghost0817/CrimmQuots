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
            ->orderBy('a.id', 'ASC')
            ->setMaxResults($limit)
            ->setFirstResult($limit * $offset)
        ;
        $result = $qb->getQuery()->execute();

        return $result;
    }

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

    public function findByTopicPage( $topic, $limit, $offset)
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('a')
            ->from('AppBundle:Quotes', 'a')
            ->where('a.keywords LIKE :topic')
            ->setParameter('topic', '%'.$topic.'%')
            ->orderBy('a.id', 'ASC')
            ->setMaxResults($limit)
            ->setFirstResult($limit * $offset)
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

    public function findByKeywordPage( $keyword, $limit, $offset)
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('a')
            ->from('AppBundle:Quotes', 'a')
            ->where('a.keywords LIKE :keyword')
            ->setParameter('keyword', '%'.$keyword.'%')
            ->orderBy('a.id', 'ASC')
            ->setMaxResults($limit)
            ->setFirstResult($limit * $offset)
        ;
        $result = $qb->getQuery()->execute();

        return $result;
    }
}