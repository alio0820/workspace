package com.new_world.operation.snapshot;

import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.awt.image.BufferedImage;

class ImageChange implements Transferable {
	private BufferedImage theImage;
	public ImageChange(BufferedImage image) {
	theImage = image;
	}
	public DataFlavor[] getTransferDataFlavors() {
	return new DataFlavor[] { DataFlavor.imageFlavor };
	}
	public boolean isDataFlavorSupported(DataFlavor flavor) {
	return flavor.equals(DataFlavor.imageFlavor);
	}
	public Object getTransferData(DataFlavor flavor)
	throws UnsupportedFlavorException {
	if (flavor.equals(DataFlavor.imageFlavor)) {
	return theImage;
	} else {
	throw new UnsupportedFlavorException(flavor);
	}
	}

	}

