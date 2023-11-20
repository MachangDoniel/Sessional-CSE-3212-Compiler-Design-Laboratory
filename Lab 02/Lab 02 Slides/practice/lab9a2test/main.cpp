#include <iostream>

using namespace std;

class myMap
{
    string key[100];
    int value[100];
    int sizee;
public:
    myMap()
    {
        cout<<"here"<<endl;
    }
    void add(string k, int v)
    {
            key[sizee] = k;
            value[sizee++] = v;
    }
    int get(string k)
    {
        for (int i=0; i<sizee; i++)
        {
            if(key[i]==k) return value[i];
        }
        return 0;
    }
};

int main()
{
    myMap mp();
//    mp.add("a",10);
 //   mp.add("b",5);
 //   cout<<mp.get("b")<<endl;
    return 0;
}
