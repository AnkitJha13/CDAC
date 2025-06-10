#include <iostream>
using namespace std;

class Appliance {
public:
    int applicationID;
    string brand;
    double price;

    void inputAppliance() {
        cout << "Enter the appliance details:" << endl;
        cout << "ApplicationID: ";
        cin >> applicationID;
        cout << "Brand: ";
        cin >> brand;
        cout << "Price: ";
        cin >> price;
    }

    void displayAppliance() {
        cout << "ApplicationID: " << applicationID << endl;
        cout << "Brand: " << brand << endl;
        cout << "Price: " << price << endl;
    }
};

class SmartAppliance : public Appliance {
    string connectivityType;
    int warrantyYears;

public:
    void inputSmartAppliance() {
        inputAppliance();  
        cout << "Connectivity Type: ";
        cin >> connectivityType;
        cout << "Warranty Years: ";
        cin >> warrantyYears;
    }

    void displaySmartAppliance() {
        displayAppliance();  
        cout << "Connectivity Type: " << connectivityType << endl;
        cout << "Warranty Years: " << warrantyYears << endl;
    }

   
    int getWarrantyYears() {
        return warrantyYears;
    }
};

int main() {
    const int size = 2;
    SmartAppliance smartAppliances[size];

    int choice;

    do {
        cout << "\n------------------------------------------" << endl;
        cout << "Choose an option:" << endl;
        cout << "1. Input Smart Appliances" << endl;
        cout << "2. Display Smart Appliances with Warranty > 2 Years" << endl;
        cout << "0. Exit" << endl;
        cout << "Enter choice: ";
        cin >> choice;

        switch (choice) {
        case 1:
            for (int i = 0; i < size; i++) {
                cout << "\nEnter details for Smart Appliance " << (i + 1) << ":" << endl;
                smartAppliances[i].inputSmartAppliance();
            }
            break;

        case 2:
            cout << "\nSmart Appliances with Warranty > 2 Years:\n";
            for (int i = 0; i < size; i++) {
                if (smartAppliances[i].getWarrantyYears() > 2) {
                    cout << "\nSmart Appliance " << (i + 1) << " details:" << endl;
                    smartAppliances[i].displaySmartAppliance();
                }
            }
            break;

        case 0:
            cout << "Exiting program." << endl;
            break;

        default:
            cout << "Invalid choice. Please select a valid option." << endl;
        }
    } while (choice != 0);

    return 0;
}
