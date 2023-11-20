#include <iostream>

using namespace std;

template<class T, class U>
class myMap
{
    T key[100];
    U value[100];
    int sizee=0;
public:
    myMap()
    {
        cout<<"here"<<endl;
    }
    void add(T k, U v)
    {
            key[sizee] = k;
            value[sizee++] = v;
    }
    U get(T k)
    {
        U u;
        for (int i=0; i<sizee; i++)
        {
            if(key[i]==k) return value[i];
        }
        return u;
    }
};

int main()
{
    myMap<string, int> mymap;
    mymap.add("a",10);
    mymap.add("b",5);
    cout<<"Searching: "<<mymap.get("b")<<endl;
    return 0;
}
