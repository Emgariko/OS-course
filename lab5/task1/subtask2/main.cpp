#include <bits/stdc++.h> 

using namespace std;

string s;

int main() {
    freopen("toptracker.log", "rt", stdin);
    cout << "PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND\n\n";
    bool parsing = false;
    int count = -1;
    while (getline(cin, s)) {
        if (s.length() >= 8 && s.substr(4, 3) == "PID") {
            parsing = true;
            count = 5;
            continue;
        }
        if (parsing && count > 0) {
            count--;
            cout << s.substr(3) << "\n";
        }
        if (count == 0) {
            parsing = false;
            cout << "\n";
            count--;
        }
    }
    return 0;
}
