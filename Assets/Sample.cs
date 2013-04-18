using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;

public class Sample : MonoBehaviour { 	
	void Start () {
		//GFUnityPulugin.start("メディアID");
		// callback先のGameObjectNameを指定
		//GFUnityPulugin.start("メディアID", "Cube");
	}

	// GameFeat画面showイベントのcallback先
	void didShowGameFeat(string msg) {
		// GameFeat画面が開いた時の処理
	}

	// GameFeat画面closeイベントのcallback先
	void didCloseGameFeat(string msg) {
		// GameFeat画面がｓ閉じた時の処理
	}
	
	void OnGUI()
	{
		Rect rect = new Rect(10, 10, 400, 100);
		bool isClicked = GUI.Button(rect, "GAME FEAT");
		if (isClicked)
		{
			loadGF();
		}
	}
	
	 void loadGF(){
		GFUnityPulugin.start("メディアID");
	}
}
