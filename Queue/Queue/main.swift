
// The idea behind the exercise below is to make the queue struct to conform to collection protocol so that it supports the features offered by Swift from the box like sequencing, indexing, mapping, filtering, sorting etc.

/**
 A collection of entities that are maintained in a sequence and can be modified by the addition of entities at one end of the sequence and the removal of entities from the other end of the sequence.
 */
struct Queue<T> {
    
    typealias DictionaryType = [T]
    
    private var contents: [T] = []
    
    init() { }
    
    init<S: Sequence>(_ sequence: S) where
        S.Iterator.Element == T {
            for element in sequence {
                contents.append(element)
            }
    }
    /**
     Adds a new element at the end of the queue
     */
    public mutating func enqueue(_ element: T) {
        contents.append(element)
    }
    /**
     Removes and returns the element at the start of the queue
     */
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return contents.removeFirst()
        }
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        return String(describing: contents)
    }
}

extension Queue: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: T...) {
        self.init(elements)
    }
}

extension Queue: Sequence {
    typealias Iterator = AnyIterator<(T)>
    
    func makeIterator() -> Iterator {
        var iterator = contents.makeIterator()
        
        return AnyIterator {
            return iterator.next()
        }
    }
}

extension Queue: Collection {
    // 1
    typealias Index = DictionaryType.Index
    typealias Element = DictionaryType.Element
    
    var startIndex: Index { return contents.startIndex }
    var endIndex: Index { return contents.endIndex }
    
    subscript(index: Index) -> Iterator.Element {
        get { return contents[index] }
    }
    
    func index(after i: Index) -> Index {
        return contents.index(after: i)
    }
}




var myQueueOfInts: Queue = [1,2,3,4,5,6,7,8,9,10]

// -------- Standard indexing and subscripting

print(myQueueOfInts[3])  // 4
//print(myQueueOfInts[99]) // Index out of range
print(myQueueOfInts.count) // 10

//--------- Queue methods

myQueueOfInts.enqueue(127)
print(myQueueOfInts)
myQueueOfInts.dequeue()
myQueueOfInts.dequeue()
myQueueOfInts.dequeue()
print(myQueueOfInts)

//---------- Iteration over the elements

for item in myQueueOfInts {
    print ("item is:", item)
}

//---------- Standard filtering

let myQueueOfStrings: Queue = ["Andrey", "Vladimir", "Michael", "Steve", "Vasily", "Joe"]

let shortNames = myQueueOfStrings.filter { $0.count < 6 }
print(shortNames)

print("minimum element is:", myQueueOfInts.min())





