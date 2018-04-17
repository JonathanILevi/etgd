
module etgd.element;

import cst_;


alias Styles	= string[string]	;
alias StyleGroup	= Tuple!(string,Styles)	;
alias StyleSheet	= StyleGroup[]	;


abstract class El {
	string	id	;
	string[]	classes	;
	string[string]	attributes	;
	
	El _parent;
	@property void	parent(El parent)	{	this._parent = parent;	}
	@property El	parent()	{	return _parent;	}
	
	//---style
	public {
		StyleSheet[]	styleSheets	;
		////string[string]	_elementStyleDefaults	;//Will override parent styles but not styles applied to this element;
		
		void addStyleSheet(StyleSheet styleSheet) {
			this.styleSheets ~= styleSheet;
		}
		string getStyle(string style) {
			foreach_reverse (styleSheet; styleSheets) {
				foreach_reverse (styleGroup; styleSheet)
				auto p = style in styleSheet[""];
			}
		}
		
		bool getStyleGroupApplies(string groupLabel) {
			if (groupLabel == "") {
				return true;
			}
			return false;
		}
	}

	this() {

	}
	
	abstract void draw();
	
	
	////void updateStyles(string[string] parentStyles) {
	////    styles = parentStyles.dup;
	////    import std.algorithm.iteration;
	////    elementDefaults	.each!((key,value){styles[key]=value;});
	////    rawStyles	.each!((key,value){styles[key]=value;});
	////    import std.stdio;
	////    styles.writeln;
	////}
}