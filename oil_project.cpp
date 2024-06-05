#include <ilopl/iloopl.h>
#include <sstream>

ILOSTLBEGIN
int main(int argc, char* argv[]) {
    IloEnv env;

    int status = 127;
    try {
        IloOplErrorHandler handler(env, cout);
        IloOplModelSource modelSource(env, "oil_project.mod");
        IloOplSettings settings(env, handler);
        IloOplModelDefinition def(modelSource, settings);
        IloCplex cplex(env);
        IloOplModel opl(def, cplex);
        opl.generate();

        if (cplex.solve()) {
            cout << endl
                << "OBJECTIVE: " << fixed << setprecision(2) << opl.getCplex().getObjValue()
                << endl;
            opl.postProcess();
            opl.printSolution(cout);
            status = 0;
        }
        else {
            cout << "No solution!" << endl;
            status = 1;
        }
    }
    catch (IloOplException& e) {
        cout << "### OPL exception: " << e.getMessage() << endl;
    }
    catch (IloException& e) {
        cout << "### CONCERT exception: ";
        e.print(cout);
        status = 2;
    }
    catch (...) {
        cout << "### UNEXPECTED ERROR ..." << endl;
        status = 3;
    }

    env.end();

    cout << endl << "--Press <Enter> to exit--" << endl;
    getchar();

    return status;
}