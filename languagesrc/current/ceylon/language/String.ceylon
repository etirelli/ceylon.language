doc "A string of characters."
by "Gavin"
shared abstract class String()
        extends Object()
        satisfies Comparable<String> & Ordered<Character> &
                  Correspondence<Natural,Character> &
                  Category & Sized & Format & 
                  Summable<String> & Castable<String> {
    
    doc "The characters that form this string."
    shared formal List<Character> characters;
    
    doc "This string, with all characters in lowercase."
    shared formal String lowercased;
    
    doc "This string, with all characters in uppercase."
    shared formal String uppercased;
    
    doc "Split the string into tokens, using the given
         separator characters. If no separator characters
         are given, split the string at any unicode 
         whitespace character."
    shared formal Ordered<String> split(
            Iterable<Character>? separators=null,
            Boolean discardSeparators=false);
    
    doc "Join the given strings, using this string as a 
         separator."
    shared formal String join(String... strings);
    
    doc "Split the string into lines of text."
    shared formal Ordered<String> lines;

    doc "This string, after discarding whitespace from the 
         beginning and end of the string."
    shared formal String trimmed;

    doc "This string, after collapsing strings of whitespace 
         into single space characters and discarding whitespace 
         from the beginning and end of the string."
    shared formal String normalized;
    
    doc "This string, with the characters in reverse order."
    shared formal String reversed;
    
    doc "Select the characters between the given indexes.
         If the start index is larger than the end index, or 
         larger than the last index of the string, return 
         the empty string. Otherwise, if the end index is 
         larger than the last index of the string, return 
         all characters from the start index to the end of 
         the string."
    //todo: would be better to support reverse spans?
    shared formal String span(Natural from, Natural to);
    
    doc "Select the characters of this string beginning at 
         the given index, returning a string no longer than 
         the given length. If this string is shorter than 
         the given length, return this string. Otherwise 
         return a string of the given length. If the start
         index is larger than the last index of the string,
         return the empty string."
    shared formal actual String segment(Natural from, 
                                        Natural length);
    
    doc "Select the first characters of this string, 
         returning a string no longer than the given 
         length. If this string is shorter than the given
         length, return this string. Otherwise return a
         string of the given length."
    shared formal String initial(Natural length);
    
    doc "Select the last characters of the string, 
         returning a string no longer than the given 
         length. If this string is shorter than the given
         length, return this string. Otherwise return a
         string of the given length."
    shared formal String final(Natural length);
    
    doc "The length of the string (the number of characters
         it contains). In the case of the empty string, the
         string has length zero. Note that this operation is
         potentially costly for long strings, since the
         underlying representation of the characters uses a
         UTF-16 encoding."
    see (longerThan, shorterThan)
    shared actual Natural size { 
        return characters.size;
    }
    
    doc "An iterator for the characters of the string."
    shared actual Iterator<Character> iterator {
        return characters.iterator;
    }
    
    doc "Returns the character at the given index in the 
         string, or null if the index is past the end of
         string. The first character in the string occurs at
         index zero. The last character in the string occurs
         at index string.size-1."
    shared actual Character? item(Natural index) { 
        return characters[index]; 
    }
    
    doc "The character indexes at which the given substring
         occurs within this string. Occurrences do not 
         overlap."
    shared formal Iterable<Natural> occurrences(String substring);
    
    doc "The first index at which the given substring occurs
         within this string, or null if the substring does
         not occur in this string."
    shared formal Natural? firstOccurrence(String substring);
    
    doc "The last index at which the given substring occurs
         within this string, or null if the substring does
         not occur in this string."
    shared formal Natural? lastOccurrence(String substring);
    
    doc "Determines if the given object is a string and, 
         if so, if it occurs as a substring of this string. 
         That is to say, a string is considered a Category 
         of its substrings."
    shared actual formal Boolean contains(Equality element);
    
    doc "Returns the concatenation of this string with the
         given string."
    shared actual formal String plus(String other);
    
    doc "Compare this string with the given string 
         lexicographically, according to the Unicode values
         of the characters."
    shared actual formal Comparison compare(String other);
    
    doc "Determines if this string is longer than the given
         length. This is a more efficient operation than
         string.size>length."
    see (size)
    shared formal Boolean longerThan(Natural length);
    
    doc "Determines if this string is shorter than the given
         length. This is a more efficient operation than
         string.size>length."
    see (size)
    shared formal Boolean shorterThan(Natural length);
    
    doc "Determines if the given object is a string, and if
         so, if this string has the same length, and the 
         same characters, in the same order, as the given 
         string."
    shared actual formal Boolean equals(Equality that);
    
    shared actual formal Integer hash;
    
    doc "Returns the string itself."
    shared actual String formatted { 
        return this; 
    }
    
    doc "Returns the string itself."
    shared actual String string { 
        return this;
    }
    
}
