
module etgd.box;

import cst_;

import std.typecons : Tuple;

import etgd.element;


class Box : Element {
	//---children
	public {
		Element[] _children;
		@property Element[] children() { return _children; }
		
		void addChild(Element child) {
			assert(child.parent is null, "Element cannot have two parents.");
			_children ~= child;
			child.parent = null;
		}
		void removeChild(child) {
			_children.remove(child);
			child.parent = this;
		}
	}
	
	this() {
		super();
	}
	this(Element[] children) {
		super();
		this.children = children;
	}
	
	override void draw() {
		
	}
	override void updateStyles(string[string] parentStyles) {
		super.updateStyles(parentStyles);
		children.each!(a=>a.updateStyles(styles));
	}
}