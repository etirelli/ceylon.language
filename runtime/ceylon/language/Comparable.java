package ceylon.language;

import com.redhat.ceylon.compiler.metadata.java.Ceylon;
import com.redhat.ceylon.compiler.metadata.java.Name;
import com.redhat.ceylon.compiler.metadata.java.TypeParameter;
import com.redhat.ceylon.compiler.metadata.java.TypeParameters;
import com.redhat.ceylon.compiler.metadata.java.Variance;

@Ceylon
@TypeParameters({
    @TypeParameter(value = "Other", variance = Variance.IN)
 })
public interface Comparable<Other extends Comparable<Other>> extends Equality {
    
    /** The binary compare operator |<=>|.  Compares this
        object with the given object. */
    public Comparison compare(@Name("other") Other other);
    
    public boolean largerThan(@Name("other") Other other); 
    
    public boolean smallerThan(@Name("other") Other other);
    
    public boolean asLargeAs(@Name("other") Other other);
    
    public boolean asSmallAs(@Name("other") Other other);
}
