package queue

import "fmt"



type node struct {
	Val string
	Next *node
}

type Queue struct {
	Head *node
}

/*
* @Description: add element to final queue
*/
func (q *Queue) Enqueue(value []string) {
	fmt.Println(value)

	var nodeCurrent node

	for _, v := range value {
		nodeCurrent = node{
			Val: v,
		}

		if q.Head == nil {
			q.Head = &nodeCurrent
		} else {
			q.Head.Next = &nodeCurrent
		}
	}
}

/*
* @Description: remove first elemetn in the queue
*/
func (q *Queue) Dequeue() string {
	if q.Head == nil {
		return ""
	}

	result := q.Head.Val

	q.Head = q.Head.Next

	return  result
}
