package com.new_world.operation.snapshot;

import javax.swing.SwingUtilities;

public class SnapshotTest {
	private int id;
	public SnapshotTest(int userId) {
		this.id = userId;
	SwingUtilities.invokeLater(new Runnable() {
	public void run() {
	new RectD(id);
	}
	});
	}
	}

