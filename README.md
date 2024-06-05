# OilProject

## Konfiguracja w CPLEX Studio

1. Utwórz nowy projekt:  
![alt text](assets/opl_new_project.png)
![alt text](assets/new_project_opl.png) 
![alt text](assets/create_opl_project.png)
2. Dodaj plik **oil_project.mod** do projektu:  
![alt text](assets/oil_project.png)
3. Dodaj konfigurację uruchomieniową przeciągając plik **oil_project.mod** na **Run Configurations**:
![alt text](assets/create_configuration_opl.png)
4. Uruchom konfigurację:  
![alt text](assets/run_configuration.png)

## Konfiguracja w Visual Studio 2022
1. **Utwórz pusty projekt w Visual Studio 2022**
2. **Pobierz całą zawartość https://github.com/MatuszG/OilProject lub pliki oil_project.***
3. **Ustawienia linkera:**
    - Sprawdź czy masz dodane zmienne środowiskowe, jeśli ich nie masz to dodaj je tak jak poniżej z właściwego katalogu odpowiadającego **CPLEX Studio** i jego konkretnej wersji:
    ![alt text](assets/Variables.png)  
    zmienna: `CPLEX_STUDIO_BINARIES2211`  
    wartość: `C:\Program Files\IBM\ILOG\CPLEX_Studio2211\opl\bin\x64_win64;C:\Program Files\IBM\ILOG\CPLEX_Studio2211\opl\oplide\;C:\Program Files\IBM\ILOG\CPLEX_Studio2211\cplex\bin\x64_win64;C:\Program Files\IBM\ILOG\CPLEX_Studio2211\cpoptimizer\bin\x64_win64`    
    zmienna: `CPLEX_STUDIO_DIR2211`  
    wartość: `C:\Program Files\IBM\ILOG\CPLEX_Studio2211`
    
    - W ustawieniach Projektu:   
    ![](assets/Project_properties.png)
        - ustaw **C/C++** -> **General** -> **Additional Include Directories** = `$(CPLEX_STUDIO_DIR2211)\opl\include;%(AdditionalIncludeDirectories)`:
        ![](assets/General.png)
        - ustaw **C/C++** -> **General** -> **Preprocessor** = `WIN64;NDEBUG;_CONSOLE;ILCUSEMT;_CRT_SECURE_NO_DEPRECATE;%(PreprocessorDefinitions)`:
        ![](assets/Preprocessor.png)
        - upewnij się, że w **C/C++** -> **Code Generation** -> **Runtime Library** = `Multi-threaded DLL (/MD)`:
          ![](assets/Code%20Generation.png)
        - ustaw **Linker** -> **General** -> **Additional Library Directories** = `$(CPLEX_STUDIO_DIR2211)\opl\include;%(AdditionalIncludeDirectories)`:
        ![](assets/Linker_general.png)
        - ustaw **Linker** -> **Input** -> **Additional Dependencies** = `$(CPLEX_STUDIO_DIR2211)\opl\include;%(AdditionalIncludeDirectories)`:
        ![](assets/Input.png)
4. Dodaj **oil_project.cpp** do projektu w **Visual Studio 2022**:  
    ![alt text](assets/Project.png)
5. Uruchom projekt za pomocą **Local Windows Debugger**:  
    ![alt text](assets/Debug.png)