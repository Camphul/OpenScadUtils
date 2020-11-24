use <__testing.scad>;
function type(x)=
(
    x==undef?undef
    : floor(x)==x? "int"
    : ( abs(x)+1>abs(x)?"float"
            : str(x)==x?"str"
                    : str(x)=="false"||str(x)=="true"?"bool"
                            : (x[0]==x[0])&&len(x)!=undef? "arr" // range below doesn't have len
                                    : let( s=str(x)
                                            , s2= split(slice(s,1,-1)," : ")
                                        )
                                            s[0]=="[" && s[len(s)-1]=="]"
                                            && all( [ for(x=s2) isint(int(x)) ] )?"range"
                                            :"unknown"
        )
);
//If all values given are nums
function is_nums(values) = is_list(values) && len([ for (i = values) if (!is_num(i)) i ]) == 0;
function is_empty_list(list) = (list == undef || len(list) == 0);
function is_num_list(list) = (!is_empty_list(list) && is_nums(list));
function vect_contains(vect, value) = len(search(value, vect)) > 0 ? true : false;

module __test_is_num_list() {
    assertFalse(is_num_list([]));
    assertTrue(is_num_list([52,2,5]));
    assertTrue(is_num_list([1,4.4,5]));
    assertTrue(is_num_list([1.2,4.76,5.2]));
    assertFalse(is_num_list([1.2,4.76,"lole"]));
    assertFalse(is_num_list([3,4,"lole"]));
}
