package org.lanqiao.vo;

import java.util.ArrayList;
import java.util.List;

public class Tree <T>{
	private T value;
	private List<Tree<T>> trees = new ArrayList<Tree<T>>();
	public Tree() {
	}
	public Tree(T value) {
		super();
		this.value = value;
	}

	public T getValue() {
		return value;
	}

	public void setValue(T value) {
		this.value = value;
	}

	public List<Tree<T>> getTrees() {
		return trees;
	}
	public void setTrees(List<Tree<T>> trees) {
		this.trees = trees;
	}
}
