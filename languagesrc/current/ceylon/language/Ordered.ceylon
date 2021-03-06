doc "Abstract supertype of iterable containers with a 
     well-defined iteration order."
by "Gavin"
see (Sequence, OrderedSet, OrderedMap)
shared interface Ordered<out Element>
        satisfies Iterable<Element> {
    
    doc "Determine if the Ordered container is empty, that
         is, if ordered.first is null."
    shared actual default Boolean empty {
        return !(first exists);
    }
    
    doc "The first element. This should be the same value as
         ordered.iterator.head."
    shared default Element? first {
        return iterator.head;
    }
    
    doc "Returns an Ordered iterator generated by skipping a 
         given number of elements, and then iterating a 
         given number of elements immediately following the 
         skipped elements."
    shared default Ordered<Element> segment(
            Natural skipping,
            Natural finishingAfter) {
        if (finishingAfter==0) {
            return {};
        }
        else {
            variable Iterator<Element> it := iterator;
            variable Natural skipped := 0;
            while (++skipped<=skipping) {
                it := iterator.tail;
            }
            
            class SegmentIterator(Iterator<Element> iterator, 
                    Natural remaining) 
                    satisfies Iterator<Element> {
                
                shared actual Element? head {
                    if (remaining==0) {
                        return null;
                    }
                    else {
                        return iterator.head;
                    }
                }
                
                shared actual Iterator<Element> tail { 
                    return SegmentIterator(iterator.tail, 
                            remaining-1);
                }
                
            }
            
            object segment satisfies Ordered<Element> {
                
                shared actual Iterator<Element> iterator =
                        SegmentIterator(it, finishingAfter);
                
                shared actual String string = "segment"; //todo
                
            }
            return segment;
        }
    }
    
}