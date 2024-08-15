classdef SmokeTests < matlab.unittest.TestCase
    
    properties (TestParameter)
        DemoFile = struct( ... 
			'TestExecutor', {@TestExecutor}, ...
			'mylineScript', {@mylineScript});
        Shortcut = struct( ... 
			'openTestExecutor', {@openTestExecutor}, ...
			'openmylineScript', {@openmylineScript}, ...
			'runProjectTests', {@runProjectTests});
    end    
    
    methods (TestClassSetup)
        
        % Shut off graphics warnings
        function killGraphicsWarning(testCase)
            ws = warning('off', 'MATLAB:hg:AutoSoftwareOpenGL');
            testCase.addTeardown(@()warning(ws));
            
        end
        
        % Close any new figures created by doc
        function saveExistingFigures(testCase)            
            existingfigs = findall(groot, 'Type', 'Figure');
            testCase.addTeardown(@()delete(setdiff(findall(groot, 'Type', 'Figure'), existingfigs)))
            
        end
        
    end
    
    methods (TestClassTeardown)
        
        function closeEditor(~)
            closeEditor;
        end
        
    end
    
    methods (Test)
        
        function demoShouldNotWarn(testCase, DemoFile)       
            testCase.verifyWarningFree(DemoFile);
            
        end
        
        
        function shortcutShouldNotWarn(testCase, Shortcut)
            testCase.verifyWarningFree(Shortcut);
            
        end
        
    end

end
