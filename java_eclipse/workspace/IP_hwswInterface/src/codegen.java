import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import org.eclipse.cdt.core.dom.ast.IASTDeclaration;
import org.eclipse.cdt.core.dom.ast.IASTDeclarator;
import org.eclipse.cdt.core.dom.ast.IASTTranslationUnit;
import org.eclipse.cdt.core.dom.ast.cpp.ICPPASTDeclarator;
import org.eclipse.cdt.core.dom.ast.cpp.ICPPASTParameterDeclaration;
import org.eclipse.cdt.core.dom.ast.gnu.cpp.GPPLanguage;
import org.eclipse.cdt.core.parser.DefaultLogService;
import org.eclipse.cdt.core.parser.FileContent;
import org.eclipse.cdt.core.parser.IParserLogService; 
import org.eclipse.cdt.core.parser.IScannerInfo;
import org.eclipse.cdt.core.parser.IncludeFileContentProvider;
import org.eclipse.cdt.core.parser.ScannerInfo;
import org.eclipse.cdt.internal.core.dom.parser.cpp.CPPASTFunctionDeclarator;
import org.eclipse.cdt.internal.core.dom.parser.cpp.CPPASTSimpleDeclSpecifier;
import org.eclipse.cdt.internal.core.dom.parser.cpp.CPPASTSimpleDeclaration;
import org.eclipse.core.runtime.CoreException;
  
import freemarker.template.Configuration;
import freemarker.template.Template; 
import freemarker.template.TemplateException;

public class codegen {
	
	public static void main(String[] args) throws CoreException {
		String ip_name = "Grayscale";
		int ip_NumGripRules = 2;	
		int[] ip_GripRulesInstances = new int[] {1,1};
		String[][] ips_forRule = new String[][] {{"GrayscaleIP", "VDMAIP"}, {"GrayscaleIP"}};
		String ip_DriverPath = "../driver/";
		String ip_ConfigPath = "../config/";
		String ip_SWPath = "";
		String system_InterruptControllerType_path = "xscugic.h";		
		String system_InterruptControllerStruct = "XScuGic";				
		
		FileContent fileContent = FileContent.createForExternalFileLocation("IPSW/" + ip_name + "_SW.h");    		
		Map definedSymbols = new HashMap();
    	String[] includePaths = new String[0];
    	IScannerInfo info = new ScannerInfo(definedSymbols, includePaths);
    	IParserLogService log = new DefaultLogService();
    	IncludeFileContentProvider emptyIncludes = IncludeFileContentProvider.getEmptyFilesProvider();
    	int opts = 8;    	
		IASTTranslationUnit translationUnit = GPPLanguage.getDefault().getASTTranslationUnit(fileContent, info, emptyIncludes, null, opts, log);
		IASTDeclaration[] declarations = translationUnit.getDeclarations();
		// it is expected that the IP SW header only contains 1 function prototype!!
		assert(declarations.length == 1);		
		CPPASTSimpleDeclSpecifier declSpecifier = (CPPASTSimpleDeclSpecifier) ((CPPASTSimpleDeclaration)declarations[0]).getDeclSpecifier();
		IASTDeclarator[] declarators = ((CPPASTSimpleDeclaration)declarations[0]).getDeclarators();
		assert(declarators.length == 1);		
		
		String ip_sw_name = ((CPPASTFunctionDeclarator) declarators[0]).getName().toString();
		String ip_sw_returnType = declSpecifier.getRawSignature() + (((CPPASTFunctionDeclarator) declarators[0]).getPointerOperators().length != 0 ? " *" : "");
		
		ICPPASTParameterDeclaration[] parameters = ((CPPASTFunctionDeclarator) declarators[0]).getParameters();		
		String[] ip_sw_param_names = new String[parameters.length];
		String[] ip_sw_param_types = new String[parameters.length];
		int param_idx = 0;
		for (ICPPASTParameterDeclaration parameter : parameters) {
			ICPPASTDeclarator paramDeclarator = parameter.getDeclarator();
			CPPASTSimpleDeclSpecifier paramDeclSpecifier = (CPPASTSimpleDeclSpecifier) parameter.getDeclSpecifier();						
			ip_sw_param_names[param_idx] = paramDeclarator.getName().toString();
			ip_sw_param_types[param_idx] = paramDeclSpecifier.getRawSignature() + (paramDeclarator.getPointerOperators().length != 0 ? " *" : "");
			param_idx++;
		}
				
		// GENERATING HEADER FILE
		Configuration cfg = new Configuration();
		try {
			//Load template from source folder
			Template template = cfg.getTemplate("src/IP_hwswInterfaceHeader_template.ftl");
			
			// Build the data-model
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("ip_name", ip_name);
			data.put("ip_NumGripRules", ip_NumGripRules);
			data.put("ips_forRule", ips_forRule);
			data.put("ip_GripRulesInstances", ip_GripRulesInstances);
			data.put("driver_path", ip_DriverPath);
			data.put("config_path", ip_ConfigPath);
			data.put("SW_path", ip_SWPath);
			data.put("interruptcontroller_path", system_InterruptControllerType_path);
			data.put("interruptcontroller", system_InterruptControllerStruct);
			data.put("ip_sw_name", ip_sw_name);
			data.put("ip_sw_returnType", ip_sw_returnType);
			data.put("ip_sw_param_names", ip_sw_param_names);
			data.put("ip_sw_param_types", ip_sw_param_types);

			// File output
			Writer file = new FileWriter (new File("gen_files/" + ip_name + "_func.h"));
			template.process(data, file);
			file.flush();
			file.close();											
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
		
		// GENERATING SOURCE FILE
		try {
			//Load template from source folder
			Template template = cfg.getTemplate("src/IP_hwswInterfaceSource_template.ftl");
			
			// Build the data-model
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("ip_name", ip_name);
			data.put("ip_NumGripRules", ip_NumGripRules);
			data.put("ips_forRule", ips_forRule);
			data.put("ip_GripRulesInstances", ip_GripRulesInstances);
			data.put("driver_path", ip_DriverPath);
			data.put("config_path", ip_ConfigPath);
			data.put("SW_path", ip_SWPath);
			data.put("interruptcontroller_path", system_InterruptControllerType_path);
			data.put("interruptcontroller", system_InterruptControllerStruct);
			data.put("ip_sw_name", ip_sw_name);
			data.put("ip_sw_returnType", ip_sw_returnType);
			data.put("ip_sw_param_names", ip_sw_param_names);
			data.put("ip_sw_param_types", ip_sw_param_types);
			
			// File output
			Writer file = new FileWriter (new File("gen_files/" + ip_name + "_func.c"));
			template.process(data, file);
			file.flush();
			file.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
	}	
}








