using UnityEngine;
using System.Runtime.InteropServices;

public class GFUnityPulugin { 

	// GFView.start
	[DllImport("__Internal")]
	private static extern void start_(string siteId);
	public static void start(string siteId) {
		if (Application.platform != RuntimePlatform.OSXEditor) {
			start_(siteId);
		}
	}

	// GFView.start delegate
	[DllImport("__Internal")]
	private static extern void startWtCallback_(string siteId, string objName);
	public static void startWtCallback(string siteId, string objName) {
		if (Application.platform != RuntimePlatform.OSXEditor) {
			startWtCallback_(siteId, objName);
		}
	}

	// GFView.conversionCheck
	[DllImport("__Internal")]
	private static extern bool conversionCheck_();
	public static bool conversionCheck() {
		if (Application.platform != RuntimePlatform.OSXEditor) {
			return conversionCheck_();
		}
		else {
			return false;
		}
	}

	// GFController.showGF
	[DllImport("__Internal")]
	private static extern void show_(string siteId);
	public static void show(string siteId) {
		if (Application.platform != RuntimePlatform.OSXEditor) {
			show_(siteId);
		}
	}

	// GFController.showGF delegate
	[DllImport("__Internal")]
	private static extern void showWtCallback_(string siteId, string objName);
	public static void showWtCallback(string siteId, string objName) {
		if (Application.platform != RuntimePlatform.OSXEditor) {
			showWtCallback_(siteId, objName);
		}
	}

	// GFController.backgroundTask
	[DllImport("__Internal")]
	private static extern void backgroundTask_();
	public static void backgroundTask() {
		if (Application.platform != RuntimePlatform.OSXEditor) {
			backgroundTask_();
		}
	}

	// GFController.conversionCheckStop
	[DllImport("__Internal")]
	private static extern void conversionCheckStop_();
	public static void conversionCheckStop() {
		if (Application.platform != RuntimePlatform.OSXEditor) {
			conversionCheckStop_();
		}
	}
}
