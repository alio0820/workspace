/*
 * $Id: MainPanel.js,v 1.83 2010-05-01 15:09:59 gaudenz Exp $
 * Copyright (c) 2006-2010, JGraph Ltd
 */
MainPanel = function(graph, history)
{
	var executeLayout = function(layout, animate, ignoreChildCount)
	{
		var cell = graph.getSelectionCell();
		
		if (cell == null ||
			(!ignoreChildCount &&
			graph.getModel().getChildCount(cell) == 0))
		{
			cell = graph.getDefaultParent();
		}

		graph.getModel().beginUpdate();
		try
		{
			layout.execute(cell);
		}
		catch (e)
		{
			throw e;
		}
		finally
		{
			// Animates the changes in the graph model except
			// for Camino, where animation is too slow
			if (animate && navigator.userAgent.indexOf('Camino') < 0)
			{
				// New API for animating graph layout results asynchronously
				var morph = new mxMorphing(graph);
				morph.addListener(mxEvent.DONE, function()
				{
					graph.getModel().endUpdate();
				});
				
				morph.startAnimation();
			}
			else
			{
				graph.getModel().endUpdate();
			}
		}
        
	};
	
	// �����˸��ֲ�ͬ��ɫ�Ĳ�ɫ�˵�
    var fillColorMenu = new Ext.menu.ColorMenu(
    {
    	items: [
    	{
    		text: 'None',
    		handler: function()
    		{
    			graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, mxConstants.NONE);
    		}
    	},
    	'-'
    	],
        handler : function(cm, color)
        {
    		if (typeof(color) == "string")
    		{
				graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, '#'+color);
			}
        }
    });

    var gradientColorMenu = new Ext.menu.ColorMenu(
    {
		items: [
        {
            text: 'North',
            handler: function()
            {
                graph.setCellStyles(mxConstants.STYLE_GRADIENT_DIRECTION, mxConstants.DIRECTION_NORTH);
            }
        },
        {
            text: 'East',
            handler: function()
            {
                graph.setCellStyles(mxConstants.STYLE_GRADIENT_DIRECTION, mxConstants.DIRECTION_EAST);
            }
        },
        {
            text: 'South',
            handler: function()
            {
                graph.setCellStyles(mxConstants.STYLE_GRADIENT_DIRECTION, mxConstants.DIRECTION_SOUTH);
            }
        },
        {
            text: 'West',
            handler: function()
            {
                graph.setCellStyles(mxConstants.STYLE_GRADIENT_DIRECTION, mxConstants.DIRECTION_WEST);
            }
        },
        '-',
		{
			text: 'None',
			handler: function()
			{
        		graph.setCellStyles(mxConstants.STYLE_GRADIENTCOLOR, mxConstants.NONE);
        	}
		},
		'-'
		],
        handler : function(cm, color)
        {
    		if (typeof(color) == "string")
    		{
    			graph.setCellStyles(mxConstants.STYLE_GRADIENTCOLOR, '#'+color);
			}
        }
    });

    var fontColorMenu = new Ext.menu.ColorMenu(
    {
    	items: [
    	{
    		text: 'None',
    		handler: function()
    		{
    			graph.setCellStyles(mxConstants.STYLE_FONTCOLOR, mxConstants.NONE);
    		}
    	},
    	'-'
    	],
        handler : function(cm, color)
        {
    		if (typeof(color) == "string")
    		{
    			graph.setCellStyles(mxConstants.STYLE_FONTCOLOR, '#'+color);
			}
        }
    });

    var lineColorMenu = new Ext.menu.ColorMenu(
    {
    	items: [
		{
			text: 'None',
			handler: function()
			{
				graph.setCellStyles(mxConstants.STYLE_STROKECOLOR, mxConstants.NONE);
			}
		},
		'-'
		],
        handler : function(cm, color)
        {
    		if (typeof(color) == "string")
    		{
				graph.setCellStyles(mxConstants.STYLE_STROKECOLOR, '#'+color);
			}
        }
    });

    var labelBackgroundMenu = new Ext.menu.ColorMenu(
    {
		items: [
		{
			text: 'None',
			handler: function()
			{
				graph.setCellStyles(mxConstants.STYLE_LABEL_BACKGROUNDCOLOR, mxConstants.NONE);
			}
		},
		'-'
		],
        handler : function(cm, color)
        {
    		if (typeof(color) == "string")
    		{
    			graph.setCellStyles(mxConstants.STYLE_LABEL_BACKGROUNDCOLOR, '#'+color);
    		}
        }
    });

    var labelBorderMenu = new Ext.menu.ColorMenu(
    {
		items: [
		{
			text: 'None',
			handler: function()
			{
				graph.setCellStyles(mxConstants.STYLE_LABEL_BORDERCOLOR, mxConstants.NONE);
			}
		},
		'-'
		],
        handler : function(cm, color)
        {
    		if (typeof(color) == "string")
    		{
    			graph.setCellStyles(mxConstants.STYLE_LABEL_BORDERCOLOR, '#'+color);
			}
        }
    });
    
    // ��������˵�
    var fonts = new Ext.data.SimpleStore(
    {
        fields: ['label', 'font'],
        data : [ ['Helvetica', 'Helvetica'], ['Verdana', 'Verdana'],
        	['Times New Roman', 'Times New Roman'], ['Garamond', 'Garamond'],
        	['Courier New', 'Courier New'],['����', '����'],['����', '����'],['����', '����'],['����', '����'],['��������', '��������'],
            ['��������', '��������'],['�����п�', '�����п�'],
            ['������κ', '������κ'],['����ϸ��', '����ϸ��'],
            ['��������', '��������'],['��������', '��������'],
            ['���Ŀ���', '���Ŀ���'],['��������', '��������'],
            ['���ķ���', '���ķ���'],['���Ĳ���', '���Ĳ���']]
    });
    
    var fontCombo = new Ext.form.ComboBox(
    {
        store: fonts,
        displayField:'label',
        mode: 'local',
        width:120,
        triggerAction: 'all',
        emptyText:'Select a font...',
        selectOnFocus:true,
        onSelect: function(entry)
        {
        	if (entry != null)
        	{
				graph.setCellStyles(mxConstants.STYLE_FONTFAMILY, entry.data.font);
				this.collapse();
        	}
        }
    });
    
	//���������������ƺ�س�Ӧ������
    fontCombo.on('specialkey', function(field, evt)
    {
    	if (evt.keyCode == 10 ||
    		evt.keyCode == 13)
    	{
    		var family = field.getValue();
    		
    		if (family != null &&
    			family.length > 0)
    		{
    			graph.setCellStyles(mxConstants.STYLE_FONTFAMILY, family);
    		}
    	}
    });

    // ����˵��������С
    var sizes = new Ext.data.SimpleStore({
        fields: ['label', 'size'],
        data : [['6pt', 6], ['8pt', 8], ['9pt', 9], ['10pt', 10], ['12pt', 12],
        	['14pt', 14], ['18pt', 18], ['24pt', 24], ['30pt', 30], ['36pt', 36],
        	['48pt', 48],['60pt', 60]]
    });
    
    var sizeCombo = new Ext.form.ComboBox(
    {
        store: sizes,
        displayField:'label',
        mode: 'local',
        width:50,
        triggerAction: 'all',
        emptyText:'12pt',
        selectOnFocus:true,
        onSelect: function(entry)
        {
        	if (entry != null)
        	{
				graph.setCellStyles(mxConstants.STYLE_FONTSIZE, entry.data.size);
				this.collapse();
        	}
        }
    });
    
	// �������������С��س�Ӧ������
    sizeCombo.on('specialkey', function(field, evt)
    {
    	if (evt.keyCode == 10 ||
    		evt.keyCode == 13)
    	{
    		var size = parseInt(field.getValue());
    		
    		if (!isNaN(size) &&
    			size > 0)
    		{
    			graph.setCellStyles(mxConstants.STYLE_FONTSIZE, size);
    		}
    	}
    });
    
    var sizeCombo = new Ext.form.ComboBox(
    {
        store: sizes,
        displayField:'label',
        mode: 'local',
        width:50,
        triggerAction: 'all',
        emptyText:'12pt',
        selectOnFocus:true,
        onSelect: function(entry)
        {
        	if (entry != null)
        	{
				graph.setCellStyles(mxConstants.STYLE_FONTSIZE, entry.data.size);
				this.collapse();
        	}
        }
    });
    
    // �򻯴����ļ����޸ĺ��״̬
    this.filename = null;
    this.modified = false;

	var updateTitle = mxUtils.bind(this, function()
	{
		this.setTitle((this.filename || '�»�ͼ') + ((this.modified) ? ' *' : '') + ' ')
	});
    
	var changeHandler = mxUtils.bind(this, function(sender, evt)
	{
		this.modified = true;
		updateTitle();
	});
	
	graph.getModel().addListener(mxEvent.CHANGE, changeHandler);
    
    this.saveDiagram = function(forceDialog)
    {
    	var name = this.filename;
    	
    	if (name == null ||
    		forceDialog)
    	{
        	var defaultValue = this.filename;
        	
        	if (defaultValue == null)
        	{
        		defaultValue = "MyDiagram";
	        	var current = defaultValue;
	        	
	        	// Finds unused filename
	        	var i = 2;
	        	
	        	while (DiagramStore.get(current) != null)
	        	{
	        		current = defaultValue + i++;
	        	}
	        	
	        	defaultValue = current;
        	}
    		
    		do
    		{
	    		name = mxUtils.prompt('Enter filename', defaultValue);
	    		
	    		if (name != null)
	    		{
		    		if (name.length > 0)
		    		{
		    			if (name != this.filename && DiagramStore.get(name) != null)
		    			{
		    				alert('File exists, please choose a different name');
		    				defaultValue = name;
		    				name = '';
		    			}
		    		}
		    		else
		    		{
		    			alert('Please choose a name');
		    		}
	    		}
    		}
    		while (name != null && name.length == 0);
    	}
    	
    	if (name != null)
    	{
    		var enc = new mxCodec(mxUtils.createXmlDocument());
			var node = enc.encode(graph.getModel());
			var xml = mxUtils.getXml(node);
			DiagramStore.put(name, xml);
			this.filename = name;
			this.modified = false;
			updateTitle();
			mxUtils.alert('Saved "'+name+'": '+xml.length+' byte(s)');
    	}
    	else
    	{
    		mxUtils.alert('Not saved');
    	}
    };
    
    this.openDiagram = function(name)
    {
    	if (!this.modified ||
    		mxUtils.confirm('������ͼ����ʧ��ǰ��ͼ�еĸ��ģ���ȷ�Ͻ�����ͼ��'))
   		{
			var xml = DiagramStore.get(name);
			
			if (xml != null && xml.length > 0)
			{
				var doc = mxUtils.parseXml(xml); 
				var dec = new mxCodec(doc); 
				dec.decode(doc.documentElement, graph.getModel());
				history.clear();
				this.filename = name;
				this.modified = false;
				updateTitle();
				mxUtils.alert('Opened "'+name+'": '+xml.length+' byte(s)');
			}
   		}
    };

    this.newDiagram = function()
    {
    	if (!this.modified ||
    		mxUtils.confirm('������ͼ����ʧ��ǰ��ͼ�еĸ��ģ���ȷ�Ͻ�����ͼ��'))
   		{
	    	var cell = new mxCell();
	    	cell.insert(new mxCell());
	    	graph.getModel().setRoot(cell);
	    	history.clear();
	    	this.filename = null;
			this.modified = false;
	    	updateTitle();
   		}
    };
    //��ʼ��ͼ���
	this.graphPanel = new Ext.Panel(
    {
    	region: 'center',
    	border:false,
        tbar:[     
        {
            text:'',
            iconCls: 'new-icon',
            tooltip: '�»�ͼ',
            handler: function()
            {
        		this.newDiagram();
            },
            scope:this
        },
        {
        	id: 'saveButton',
            text:'',
            iconCls: 'save-icon',
            tooltip: '�����ͼ',
            handler: function()
            {
        		this.saveDiagram();
            },
            scope:this
        },
        {
        	id: 'saveAsButton',
            text:'',
            iconCls: 'saveas-icon',
            tooltip: '��ͼ���Ϊ...',
            handler: function()
            {
        		this.saveDiagram(true);
            },
            scope:this
        },
        '-',
        {
        	id: 'print',
            text:'',
            iconCls: 'print-icon',
            tooltip: '��ӡԤ��',
            handler: function()
            {
        		var preview = new mxPrintPreview(graph);
        		preview.autoOrigin = false;
        		preview.open();
            },
            scope:this
        },
        {
        	id: 'posterprint',
            text:'',
            iconCls: 'press-icon',
            tooltip: '����ʽ��ӡԤ��',
            handler: function()
            {
	        	try
	        	{
	        		var pageCount = mxUtils.prompt('������Ҫ��ӡ�����ҳ��:', '1');
					
					if (pageCount != null)
					{
						var scale = mxUtils.getScaleForPageCount(pageCount, graph);
						var preview = new mxPrintPreview(graph, scale);
						preview.open();
					}
	        	}
	        	catch (e)
	        	{
	        		// ignore
	        	}
            },
            scope:this
        },
        {
        	id: 'view',
            text:'',
            iconCls: 'preview-icon',
            tooltip: 'Ԥ����ͼ',
            handler: function()
            {
        		mxUtils.show(graph, null, 10, 10);
            },
            scope:this
        },
        '-',
        {
        	id: 'cut',
            text:'',
            iconCls: 'cut-icon',
            tooltip: '����',
            handler: function()
            {
        		mxClipboard.cut(graph);
        	},
            scope:this
        },{
       		id: 'copy',
            text:'',
            iconCls: 'copy-icon',
            tooltip: '����',
            handler: function()
            {
        		mxClipboard.copy(graph);
        	},
            scope:this
        },{
            text:'',
            iconCls: 'paste-icon',
            tooltip: 'ճ��',
            handler: function()
            {
            	mxClipboard.paste(graph);
            },
            scope:this
        },
        '-',
        {
       		id: 'delete',
            text:'',
            iconCls: 'delete-icon',
            tooltip: 'ɾ��',
            handler: function()
            {
        		graph.removeCells();
        	},
            scope:this
        },
        '-',
        {
        	id: 'undo',
            text:'',
            iconCls: 'undo-icon',
            tooltip: '����',
            handler: function()
            {
            	history.undo();
            },
            scope:this
        },{
        	id: 'redo',
            text:'',
            iconCls: 'redo-icon',
            tooltip: '�ظ�',
            handler: function()
            {
        		history.redo();
            },
            scope:this
        },
        '-',
        fontCombo,
        ' ',
        sizeCombo,
        '-',
		{
			id: 'bold',
            text: '',
            iconCls:'bold-icon',
            tooltip: '����',
            handler: function()
            {
        		graph.toggleCellStyleFlags(mxConstants.STYLE_FONTSTYLE, mxConstants.FONT_BOLD);
        	},
            scope:this
        },
		{
			id: 'italic',
            text: '',
            tooltip: 'б��',
            iconCls:'italic-icon',
            handler: function()
            {
            	graph.toggleCellStyleFlags(mxConstants.STYLE_FONTSTYLE, mxConstants.FONT_ITALIC);
            },
            scope:this
        },
		{
			id: 'underline',
            text: '',
            tooltip: '�»���',
            iconCls:'underline-icon',
            handler: function()
            {
        		graph.toggleCellStyleFlags(mxConstants.STYLE_FONTSTYLE, mxConstants.FONT_UNDERLINE);
        	},
            scope:this
        },
        '-',
        {
            id: 'align',
            text:'',
            iconCls: 'left-icon',
            tooltip: '�ı�����',
            handler: function() { },
            menu:
            {
                id:'reading-menu',
                cls:'reading-menu',
                items: [
                {
                    text:'�����',
                    checked:false,
                    group:'rp-group',
                    scope:this,
                    iconCls:'left-icon',
                    handler: function()
                    {
                		graph.setCellStyles(mxConstants.STYLE_ALIGN, mxConstants.ALIGN_LEFT);
                	}
                },
                {
                    text:'����',
                    checked:true,
                    group:'rp-group',
                    scope:this,
                    iconCls:'center-icon',
                    handler: function()
                    {
                		graph.setCellStyles(mxConstants.STYLE_ALIGN, mxConstants.ALIGN_CENTER);
                	}
                },
                {
                    text:'�Ҷ���',
                    checked:false,
                    group:'rp-group',
                    scope:this,
                    iconCls:'right-icon',
                    handler: function()
                    {
                		graph.setCellStyles(mxConstants.STYLE_ALIGN, mxConstants.ALIGN_RIGHT);
                	}
                },
                '-',
                {
                    text:'���˶���',
                    checked:false,
                    group:'vrp-group',
                    scope:this,
                    iconCls:'top-icon',
                    handler: function()
                    {
                		graph.setCellStyles(mxConstants.STYLE_VERTICAL_ALIGN, mxConstants.ALIGN_TOP);
                	}
                },
                {
                    text:'��ֱ����',
                    checked:true,
                    group:'vrp-group',
                    scope:this,
                    iconCls:'middle-icon',
                    handler: function()
                    {
                		graph.setCellStyles(mxConstants.STYLE_VERTICAL_ALIGN, mxConstants.ALIGN_MIDDLE);
                	}
                },
                {
                    text:'�׶˶���',
                    checked:false,
                    group:'vrp-group',
                    scope:this,
                    iconCls:'bottom-icon',
                    handler: function()
                    {
                		graph.setCellStyles(mxConstants.STYLE_VERTICAL_ALIGN, mxConstants.ALIGN_BOTTOM);
                    }
                }]
            }
        },
        '-',
		{
			id: 'fontcolor',
            text: '',
            tooltip: '������ɫ',
            iconCls:'fontcolor-icon',
            menu: fontColorMenu // <-- submenu by reference
        },
		{
			id: 'linecolor',
            text: '',
            tooltip: '������ɫ',
            iconCls:'linecolor-icon',
            menu: lineColorMenu // <-- submenu by reference
        },
		{
			id: 'fillcolor',
            text: '',
            tooltip: '�����ɫ',
            iconCls:'fillcolor-icon',
            menu: fillColorMenu // <-- submenu by reference
        }],
        bbar:[
        {
            text:'����',
            iconCls: 'zoom-icon',
            handler: function(menu) { },
            menu:
            {
                items: [
                {
		            text:'�Զ���',
		            scope:this,
		            handler: function(item)
		            {
		            	var value = mxUtils.prompt('������ͼ�μ�ࣨ��λ���أ�', parseInt(graph.getView().getScale() * 100));
										            	
		            	if (value != null)
		            	{
			            	graph.getView().setScale(parseInt(value) / 100);
			            }
		            }
		        },
		        '-',
                {
		            text:'400%',
		            scope:this,
		            handler: function(item)
		            {
						graph.getView().setScale(4);
		            }
		        },
                {
		            text:'200%',
		            scope:this,
		            handler: function(item)
		            {
						graph.getView().setScale(2);
		            }
		        },
                {
		            text:'150%',
		            scope:this,
		            handler: function(item)
		            {
						graph.getView().setScale(1.5);
		            }
		        },
		        {
		            text:'100%',
		            scope:this,
		            handler: function(item)
		            {
		                graph.getView().setScale(1);
		            }
		        },
                {
		            text:'75%',
		            scope:this,
		            handler: function(item)
		            {
						graph.getView().setScale(0.75);
		            }
		        },
                {
		            text:'50%',
		            scope:this,
		            handler: function(item)
		            {
						graph.getView().setScale(0.5);
		            }
		        },
                {
		            text:'25%',
		            scope:this,
		            handler: function(item)
		            {
						graph.getView().setScale(0.25);
		            }
		        },
                '-',
                {
		            text:'�Ŵ�',
		            iconCls: 'zoomin-icon',
		            scope:this,
		            handler: function(item)
		            {
						graph.zoomIn();
		            }
		        },
		        {
		            text:'��С',
		            iconCls: 'zoomout-icon',
		            scope:this,
		            handler: function(item)
		            {
		                graph.zoomOut();
		            }
		        },
		        '-',
		        {
		            text:'ʵ�ʳߴ�',
		            iconCls: 'zoomactual-icon',
		            scope:this,
		            handler: function(item)
		            {
		                graph.zoomActual();
		            }
		        },
		        {
		            text:'�ʺϴ���',
		            iconCls: 'fit-icon',
		            scope:this,
		            handler: function(item)
		            {
		                graph.fit();
		            }
		        }]
            }
        },
        '-',
        {
            text:'����',
            iconCls: 'diagram-icon',
            handler: function(menu) { },
            menu:
            {
                items: [
		        {
		            text:'��ֱ��������',
		            scope:this,
		            handler: function(item)
		            {
		        		executeLayout(new mxPartitionLayout(graph, false));
		            }
		        },
		        {
		            text:'ˮƽ��������',
		            scope:this,
		            handler: function(item)
		            {
	        			executeLayout(new mxPartitionLayout(graph));
		            }
		        },
		        '-',
		        {
		            text:'��ֱ��ջ����',
		            scope:this,
		            handler: function(item)
		            {
		                var layout = new mxStackLayout(graph, false);
		                layout.fill = true;
		                executeLayout(layout);
		            }
		        },
		        {
		            text:'ˮƽ��ջ����',
		            scope:this,
		            handler: function(item)
		            {
		                var layout = new mxStackLayout(graph, true);
		                layout.fill = true;
		                executeLayout(layout);
		            }
		        },
		        '-',
		        {
		            text:'Place Edge Labels',
		            scope:this,
		            handler: function(item)
		            {
		        		executeLayout(new mxEdgeLabelLayout(graph));
		            }
		        },
		        {
		            text:'Parallel Edges',
		            scope:this,
		            handler: function(item)
		            {
		        		executeLayout(new mxParallelEdgeLayout(graph));
		            }
		        },
		        '-',
		        {
		            text:'��ֱ�ֲ㲼��',
		            scope:this,
		            handler: function(item)
		            {
	        			var layout = new mxHierarchicalLayout(graph);
		        		executeLayout(layout, true);
		            }
		        },
		        {
		            text:'ˮƽ�ֲ㲼��',
		            scope:this,
		            handler: function(item)
		            {
		        		var layout = new mxHierarchicalLayout(graph,mxConstants.DIRECTION_WEST);
		        		executeLayout(layout, true);
		            }
		        },
		        '-',
		        {
		            text:'��ֱ��״����',
		            scope:this,
		            handler: function(item)
		            {
		        		var layout = new mxCompactTreeLayout(graph, false);
		        		executeLayout(layout, true, true);
		            }
		        },
		        {
		            text:'ˮƽ��״����',
		            scope:this,
		            handler: function(item)
		            {
		        		var layout = new mxCompactTreeLayout(graph);
		        		executeLayout(layout, true, true);
		            }
		        },
		        '-',
		        {
		            text:'�л�����',
		            scope:this,
		            handler: function(item)
		            {
		                var layout = new mxFastOrganicLayout(graph);
		                layout.forceConstant = 80;
		        		executeLayout(layout, true);
		            }
		        },
		        {
		            text:'���β���',
		            scope:this,
		            handler: function(item)
		            {
		        		executeLayout(new mxCircleLayout(graph), true);
		            }
		        }]
            }
        },
        '-',
        {
            text:'ѡ��',
            iconCls: 'preferences-icon',
            handler: function(menu) { },
            menu:
            {
                items: [
                {
                    text:'����',
                    handler: function(menu) { },
                    menu:
                    {
                    	items: [
        		        {
        		            text:'�����С',
        		            scope:this,
        		            handler: function()
        		            {
        						var value = mxUtils.prompt('�����������С ����λ���أ�', graph.gridSize);
        										            	
        		            	if (value != null)
        		            	{
        			            	graph.gridSize = value;
        			            }
        		            }
        		        },
        		        {
        		            checked: true,
        		            text:'��������',
        		            scope:this,
        		            checkHandler: function(item, checked)
        		            {
        		                graph.setGridEnabled(checked);
        		            }
        		        }
        		        ]
                    }
                },
                {
	                text:'��ʽ',
	                handler: function(menu) { },
	                menu:
	                {
	                	items: [
	                	{
				            text:'������ʽ',
				            scope:this,
				            handler: function(item)
				            {
							    var node = mxUtils.load('resources/basic-style.xml').getDocumentElement();
								var dec = new mxCodec(node.ownerDocument);
								dec.decode(node, graph.getStylesheet());    
								graph.refresh();
				            }
				        },
				        {
				            text:'Ĭ����ʽ',
				            scope:this,
				            handler: function(item)
				            {
							    var node = mxUtils.load('resources/default-style.xml').getDocumentElement();
								var dec = new mxCodec(node.ownerDocument);
								dec.decode(node, graph.getStylesheet());    
								graph.refresh();
				            }
				        }]
	                }
                },
                {
                    text:'��ǩ',
                    handler: function(menu) { },
                    menu:
                    {
                    	items: [
        		        {
        		            checked: true,
        		            text:'��ʾ��ǩ',
        		            scope:this,
        		            checkHandler: function(item, checked)
        		            {
        		            	graph.labelsVisible = checked;
        		            	graph.refresh();
        		            }
        		        },
        		        {
        		            checked: true,
        		            text:'�ƶ����߱�ǩ',
        		            scope:this,
        		            checkHandler: function(item, checked)
        		            {
        		            	graph.edgeLabelsMovable = checked;
        		            }
        		        },
        		        {
        		            checked: false,
        		            text:'�ƶ���״��ǩ',
        		            scope:this,
        		            checkHandler: function(item, checked)
        		            {
        		           		graph.vertexLabelsMovable = checked;
        		            }
        		        },
        		        '-',
        		        {
        		            checked: true,
        		            text:'HTML��ǩ',
        		            scope:this,
        		            checkHandler: function(item, checked)
        		            {
        		           		graph.setHtmlLabels(checked);
        		           		graph.refresh();
        		            }
        		        }
            	        ]
                    }
                },
                '-',
                {
                    text:'������',
                    handler: function(menu) { },
                    menu:
                    {
                    	items: [
                        {
        		            checked: true,
        		            text:'������',
        		            scope:this,
        		            checkHandler: function(item, checked)
        		            {
        		                graph.setConnectable(checked);
        		            }
        		        },
        		        {
        		            checked: false,
        		            text:'���߿�����',
        		            scope:this,
        		            checkHandler: function(item, checked)
        		            {
        		                graph.setConnectableEdges(checked);
        		            }
        		        },
        		        '-',
                        {
        		            checked: true,
        		            text:'����Ŀ��',
        		            scope:this,
        		            checkHandler: function(item, checked)
        		            {
        		                graph.connectionHandler.setCreateTarget(checked);
        		            }
        		        },
        		        {
        		            checked: true,
        		            text:'�Ͽ��ƶ�',
        		            scope:this,
        		            checkHandler: function(item, checked)
        		            {
        		                graph.setDisconnectOnMove(checked);
        		            }
        		        },
        		        '-',
        		        {
        		        	checked: false,
        		        	text:'���/ɾ����ͷ',
        		        	scope:this,
        		        	checkHandler: function(item, checked)
        		        	{
        		        		mxEdgeHandler.prototype.addEnabled = checked;
        		        		mxEdgeHandler.prototype.removeEnabled = checked;
        		        	}
        		        }
            	        ]
                    }
                },
                {
                    text:'��֤',
                    handler: function(menu) { },
                    menu:
                    {
                    	items: [
        		        {
        		            checked: true,
        		            text:'���������߶˶���',
        		            scope:this,
        		            checkHandler: function(item, checked)
        		            {
        		                graph.setAllowDanglingEdges(checked);
        		            }
        		        },
        		        {
        		            checked: false,
        		            text:'��¡��Ч�ı�Ե',
        		            scope:this,
        		            checkHandler: function(item, checked)
        		            {
        		                graph.setCloneInvalidEdges(checked);
        		            }
        		        },
        		        '-',
        		        {
        		            checked: false,
        		            text:'����ѭ������',
        		            scope:this,
        		            checkHandler: function(item, checked)
        		            {
        		                graph.setAllowLoops(checked);
        		            }
        		        },
        		        {
        		            checked: true,
        		            text:'���ͼ',
        		            scope:this,
        		            checkHandler: function(item, checked)
        		            {
        		                graph.setMultigraph(checked);
        		            }
        		        }
            	        ]
                    }
                },
                '-',
		        {
		            checked: false,
		            text:'ҳ�沼��',
		            scope:this,
		            checkHandler: function(item, checked)
		            {
						graph.pageVisible = checked;
						graph.preferPageSize = graph.pageBreaksVisible;
						graph.view.validate();
						graph.sizeDidChange();
		            }
		        },
		        {
		            checked: false,
		            text:'��ҳ��',
		            scope:this,
		            checkHandler: function(item, checked)
		            {
						graph.pageBreaksVisible = checked;
						graph.preferPageSize = graph.pageBreaksVisible;
						graph.sizeDidChange();
		            }
		        },
                '-',
		        {
		            checked: true,
		            text:'�ϸ��������',
		            scope:this,
		            checkHandler: function(item, checked)
		            {
						graph.useScrollbarsForPanning = checked;
		            }
		        },
		        {
		            checked: true,
		            text:'��������',
		            scope:this,
		            checkHandler: function(item, checked)
		            {
						graph.setAllowNegativeCoordinates(checked);
		            }
		        },
                '-',
		        {
		            text:'��ʾXML����',
		            scope:this,
		            handler: function(item)
		            {
						var enc = new mxCodec(mxUtils.createXmlDocument());
						var node = enc.encode(graph.getModel());
						
						mxUtils.popup(mxUtils.getPrettyXml(node));
		            }
		        },
		        {
		            text:'����XML����',
		            scope:this,
		            handler: function(item)
		            {
		        		var xml = mxUtils.prompt('������Ҫ������XML����:', '');
		        		
		        		if (xml != null && xml.length > 0)
		        		{
		        			var doc = mxUtils.parseXml(xml); 
		        			var dec = new mxCodec(doc); 
		        			dec.decode(doc.documentElement, graph.getModel()); 
		        		}
		            }
		        },
		        {
		            text:'�ϴ�XML����',
		            scope:this,
		            handler: function(item)
		            {
		                //�õ�XML�ĵ�
		                var enc = new mxCodec(mxUtils.createXmlDocument());
						var node = enc.encode(graph.getModel());
						//�õ�HTML����
						 var html = '<html>';
                        html += '<head>';
                        var base = document.getElementsByTagName('base');
                        for (var i = 0; i < base.length; i++) {
                            html += base[i].outerHTML;
                        }
                        html += '<style>';
                        for (var i = 0; i < document.styleSheets.length; i++) {
                            try {
                                html += document.styleSheets(i).cssText;
                            } 
                            catch (e) {
                            }
                        }
                        html += '</style>';
                        html += '</head>';
                        html += '<body>';
                        html += graph.container.innerHTML;
                        html += '</body>';
                        html += '<html>';
						
		        		UploadXmlHtmlDocument(node.xml,html);
		            }
		        },
		        '-',
		        {
		            text:'����̨',
		            scope:this,
		            handler: function(item)
		            {
		            	mxLog.setVisible(!mxLog.isVisible());
		            }
		        }]
            }
        }],

        onContextMenu : function(node, e)
        {
    		var selected = !graph.isSelectionEmpty();

    		this.menu = new Ext.menu.Menu(
    		{
                items: [{
                    text:'����',
                    iconCls:'undo-icon',
                    disabled: !history.canUndo(),
                    scope: this,
                    handler:function()
                    {
                        history.undo();
                    }
                },'-',{
                    text:'����',
                    iconCls:'cut-icon',
                    disabled: !selected,
                    scope: this,
                    handler:function()
                    {
                    	mxClipboard.cut(graph);
                    }
                },{
                    text:'����',
                    iconCls:'copy-icon',
                    disabled: !selected,
                    scope: this,
                    handler:function()
                    {
                    	mxClipboard.copy(graph);
                    }
                },{
                    text:'ճ��',
                    iconCls:'paste-icon',
                    disabled: mxClipboard.isEmpty(),
                    scope: this,
                    handler:function()
                    {
                    	mxClipboard.paste(graph);
                    }
                },
                '-',
                {
                    text:'ɾ��',
                    iconCls:'delete-icon',
                    disabled: !selected,
                    scope: this,
                    handler:function()
                    {
                    	graph.removeCells();
                    }
                },
              	'-',
              	{
		            text:'��ʽ',
		            disabled: !selected,
		            handler: function() { },
		            menu:
		            {
		            	items: [
		            	{
		            		text:'����',
				            disabled: !selected,
				            handler: function() { },
				            menu:
				            {
				            	items: [
				                {
						            text: '���ɫ',
						            iconCls:'fillcolor-icon',
						            menu: fillColorMenu
						        },
				                {
						            text: '����ɫ',
						            menu: gradientColorMenu
						        },
						        '-',
						        {
						            text: 'ͼƬ',
						            handler: function()
						            {
						            	var value = '';
						            	var state = graph.getView().getState(graph.getSelectionCell());
						            	
						            	if (state != null)
						            	{
						            		value = state.style[mxConstants.STYLE_IMAGE] || value;
						            	}

					            		value = mxUtils.prompt('������ͼƬ��URL��ַ:', value);
						            	
						            	if (value != null)
						            	{
							            	graph.setCellStyles(mxConstants.STYLE_IMAGE, value);
							            }
						            }
						        },
						        {
						            text:'��Ӱ',
						            scope:this,
						            handler: function()
						            {
						                graph.toggleCellStyles(mxConstants.STYLE_SHADOW);
						            }
						        },
						        '-',
						        {
						            text:'͸����',
						            scope:this,
						            handler: function()
						            {
						            	var value = mxUtils.prompt('������͸���� (0-100%)', '100');
						            	
						            	if (value != null)
						            	{
							            	graph.setCellStyles(mxConstants.STYLE_OPACITY, value);
							            }
						            }
						        }]
				            }
		            	},
			            {
		            		text:'��ǩ',
				            disabled: !selected,
				            handler: function() { },
				            menu:
				            {
				            	items: [
								{
						            text: 'ǰ��ɫ',
						            iconCls:'fontcolor-icon',
						            menu: fontColorMenu
						        },
						        '-',
				                {
						            text: '��ǩ���ɫ',
						            menu: labelBackgroundMenu
						        },
				                {
						            text: '��ǩ�߿���ɫ',
						            menu: labelBorderMenu
						        },
						        '-',
								{
						            text:'��ת��ǩ',
						            scope:this,
						            handler: function()
						            {
						                graph.toggleCellStyles(mxConstants.STYLE_HORIZONTAL, true);
						            }
						        },
						        {
						            text:'�ı�͸����',
						            scope:this,
						            handler: function()
						            {
						            	var value = mxUtils.prompt('�������ı�͸���� (0-100%)', '100');
						            	
						            	if (value != null)
						            	{
							            	graph.setCellStyles(mxConstants.STYLE_TEXT_OPACITY, value);
							            }
						            }
						        },
						        '-',
					            {
				            		text:'λ��',
						            disabled: !selected,
						            handler: function() { },
						            menu:
						            {
						            	items: [
					            		{
								            text: '����',
								            scope:this,
								            handler: function()
								            {
					            				graph.setCellStyles(mxConstants.STYLE_VERTICAL_LABEL_POSITION, mxConstants.ALIGN_TOP);
					            				graph.setCellStyles(mxConstants.STYLE_VERTICAL_ALIGN, mxConstants.ALIGN_BOTTOM);
								            }
								        },
					            		{
								            text: '��ֱ����',
								            scope:this,
								            handler: function()
								            {
					            				graph.setCellStyles(mxConstants.STYLE_VERTICAL_LABEL_POSITION, mxConstants.ALIGN_MIDDLE);
					            				graph.setCellStyles(mxConstants.STYLE_VERTICAL_ALIGN, mxConstants.ALIGN_MIDDLE);
								            }
								        },
					            		{
								            text: '�׶�',
								            scope:this,
								            handler: function()
								            {
					            				graph.setCellStyles(mxConstants.STYLE_VERTICAL_LABEL_POSITION, mxConstants.ALIGN_BOTTOM);
					            				graph.setCellStyles(mxConstants.STYLE_VERTICAL_ALIGN, mxConstants.ALIGN_TOP);
								            }
								        },
								        '-',
					            		{
								            text: '�����',
								            scope:this,
								            handler: function()
								            {
					            				graph.setCellStyles(mxConstants.STYLE_LABEL_POSITION, mxConstants.ALIGN_LEFT);
					            				graph.setCellStyles(mxConstants.STYLE_ALIGN, mxConstants.ALIGN_RIGHT);
								            }
								        },
					            		{
								            text: '����',
								            scope:this,
								            handler: function()
								            {
				            				graph.setCellStyles(mxConstants.STYLE_LABEL_POSITION, mxConstants.ALIGN_CENTER);
				            				graph.setCellStyles(mxConstants.STYLE_ALIGN, mxConstants.ALIGN_CENTER);
								            }
								        },
					            		{
								            text: '�Ҷ���',
								            scope:this,
								            handler: function()
								            {
				            				graph.setCellStyles(mxConstants.STYLE_LABEL_POSITION, mxConstants.ALIGN_RIGHT);
				            				graph.setCellStyles(mxConstants.STYLE_ALIGN, mxConstants.ALIGN_LEFT);
								            }
								        }]
						            }
					            },
						        '-',
								{
						            text:'����',
						            scope:this,
						            handler: function()
						            {
						                graph.toggleCellStyles(mxConstants.STYLE_NOLABEL, false);
						            }
						        }]
				            }
			            },
			            '-',
			            {
		            		text:'����',
				            disabled: !selected,
				            handler: function() { },
				            menu:
				            {
				            	items: [
			            		{
						            text: '������ɫ',
						            iconCls:'linecolor-icon',
						            menu: lineColorMenu
						        },
						        '-',
						        {
						            text:'����',
						            scope:this,
						            handler: function()
						            {
						                graph.toggleCellStyles(mxConstants.STYLE_DASHED);
						            }
						        },
								{
						            text: '�������',
						            handler: function()
						            {
						            	var value = '0';
						            	var state = graph.getView().getState(graph.getSelectionCell());
						            	
						            	if (state != null)
						            	{
						            		value = state.style[mxConstants.STYLE_STROKEWIDTH] || 1;
						            	}
	
					            		value = mxUtils.prompt('Enter Linewidth (Pixels)', value);
							            	
						            	if (value != null)
						            	{
							            	graph.setCellStyles(mxConstants.STYLE_STROKEWIDTH, value);
							            }
						            }
						        }]
				            }
			            },
		            	{
		            		text:'������',
		            		menu:
		            		{
		            			items: [
		            			{
						            text: 'ֱ������',
						            icon: 'images/straight.gif',
						            handler: function()
						            {
						            	graph.setCellStyle('straight');
						            }
						        },
						        '-',
						        {
						            text: 'ˮƽ����',
						            icon: 'images/connect.gif',
						            handler: function()
						            {
						            	graph.setCellStyle(null);
						            }
						        },
						        {
						            text: '��ֱ����',
						            icon: 'images/vertical.gif',
						            handler: function()
						            {
						            	graph.setCellStyle('vertical');
						            }
						        },
						        '-',
						        {
						            text: 'ʵ���ϵ',
						           	icon: 'images/entity.gif',
						            handler: function()
						            {
						            	graph.setCellStyle('edgeStyle=entityRelationEdgeStyle');
						            }
						        },
						        {
						            text: '��ͷ',
						            icon: 'images/arrow.gif',
						            handler: function()
						            {
						            	graph.setCellStyle('arrow');
						            }
						        },
						        '-',
						        {
						            text: 'ƽ��',
						            handler: function()
						            {
						        		graph.toggleCellStyles(mxConstants.STYLE_NOEDGESTYLE, false);
						            }
						        }]
		            		}
		            	},
				        '-',
		            	{
							text:'������ʼ',
							menu:
							{
		            			items: [
		            			{
		            				text: '��',
						            icon: 'images/open_start.gif',
						            handler: function()
						            {
						            	graph.setCellStyles(mxConstants.STYLE_STARTARROW, mxConstants.ARROW_OPEN);
						            }
						        },
						        {
						            text: '����',
						            icon: 'images/classic_start.gif',
						            handler: function()
						            {
						            	graph.setCellStyles(mxConstants.STYLE_STARTARROW, mxConstants.ARROW_CLASSIC);
						            }
						        },
						        {
						            text: '��״',
						            icon: 'images/block_start.gif',
						            handler: function()
						            {
						            	graph.setCellStyles(mxConstants.STYLE_STARTARROW, mxConstants.ARROW_BLOCK);
						            }
						        },
						        '-',
						        {
						            text: '����',
						            icon: 'images/diamond_start.gif',
						            handler: function()
						            {
						            	graph.setCellStyles(mxConstants.STYLE_STARTARROW, mxConstants.ARROW_DIAMOND);
						            }
						        },
						        {
						            text: '��Բ',
						            icon: 'images/oval_start.gif',
						            handler: function()
						            {
						            	graph.setCellStyles(mxConstants.STYLE_STARTARROW, mxConstants.ARROW_OVAL);
						            }
						        },
						        '-',
				                {
						            text: '��',
						            handler: function()
						            {
						            	graph.setCellStyles(mxConstants.STYLE_STARTARROW, mxConstants.NONE);
						            }
						        },
				                {
						            text: '��С',
						            handler: function()
						            {
						            	var size = mxUtils.prompt('�������С', mxConstants.DEFAULT_MARKERSIZE);
						            	
						            	if (size != null)
						            	{
							            	graph.setCellStyles(mxConstants.STYLE_STARTSIZE, size);
							            }
						            }
				                }]
							}
						},
						{
							text:'��������',
							menu:
							{
								items: [
								{
						            text: '��',
						            icon: 'images/open_end.gif',
						            handler: function()
						            {
						            	graph.setCellStyles(mxConstants.STYLE_ENDARROW, mxConstants.ARROW_OPEN);
						            }
						        },
						        {
						            text: '����',
						            icon: 'images/classic_end.gif',
						            handler: function()
						            {
						            	graph.setCellStyles(mxConstants.STYLE_ENDARROW, mxConstants.ARROW_CLASSIC);
						            }
						        },
						        {
						            text: '��״',
						            icon: 'images/block_end.gif',
						            handler: function()
						            {
						            	graph.setCellStyles(mxConstants.STYLE_ENDARROW, mxConstants.ARROW_BLOCK);
						            }
						        },
						        '-',
						        {
						            text: '����',
						            icon: 'images/diamond_end.gif',
						            handler: function()
						            {
						            	graph.setCellStyles(mxConstants.STYLE_ENDARROW, mxConstants.ARROW_DIAMOND);
						            }
						        },
						        {
						            text: '��Բ',
						            icon: 'images/oval_end.gif',
						            handler: function()
						            {
						            	graph.setCellStyles(mxConstants.STYLE_ENDARROW, mxConstants.ARROW_OVAL);
						            }
						        },
						        '-',
				                {
						            text: '��',
						            handler: function()
						            {
						            	graph.setCellStyles(mxConstants.STYLE_ENDARROW, 'none');
						            }
				                },
				                {
				                	text: '��С',
				                	handler: function()
						            {
						            	var size = mxUtils.prompt('�������С', mxConstants.DEFAULT_MARKERSIZE);
						            	
						            	if (size != null)
						            	{
							            	graph.setCellStyles(mxConstants.STYLE_ENDSIZE, size);
							            }
						            }
						        }]
							}
						},
						'-',
						{
							text:'���',
							menu:
							{
				                items: [
							    {
						            text: '����',
						            handler: function()
						            {
						            	var value = '0';
						            	var state = graph.getView().getState(graph.getSelectionCell());
						            	
						            	if (state != null)
						            	{
						            		value = state.style[mxConstants.STYLE_SPACING_TOP] || value;
						            	}

					            		value = mxUtils.prompt('�����붥�˼�� ����λ���أ�', value);
							            	
						            	if (value != null)
						            	{
							            	graph.setCellStyles(mxConstants.STYLE_SPACING_TOP, value);
							            }
						            }
						        },
						        {
						            text: '�Ҷ�',
						            handler: function()
						            {
						            	var value = '0';
						            	var state = graph.getView().getState(graph.getSelectionCell());
						            	
						            	if (state != null)
						            	{
						            		value = state.style[mxConstants.STYLE_SPACING_RIGHT] || value;
						            	}

					            		value = mxUtils.prompt('�������Ҷ˼�� ����λ���أ�', value);
							            	
						            	if (value != null)
						            	{
							            	graph.setCellStyles(mxConstants.STYLE_SPACING_RIGHT, value);
							            }
						            }
						        },
						        {
						            text: '�׶�',
						            handler: function()
						            {
						            	var value = '0';
						            	var state = graph.getView().getState(graph.getSelectionCell());
						            	
						            	if (state != null)
						            	{
						            		value = state.style[mxConstants.STYLE_SPACING_BOTTOM] || value;
						            	}

					            		value = mxUtils.prompt('������׶˼�� ����λ���أ�', value);
							            	
						            	if (value != null)
						            	{
							            	graph.setCellStyles(mxConstants.STYLE_SPACING_BOTTOM, value);
							            }
						            }
						        },
						        {
						            text: '���',
						            handler: function()
						            {
						            	var value = '0';
						            	var state = graph.getView().getState(graph.getSelectionCell());
						            	
						            	if (state != null)
						            	{
						            		value = state.style[mxConstants.STYLE_SPACING_LEFT] || value;
						            	}

					            		value = mxUtils.prompt('��������˼�� ����λ���أ�', value);
							            	
						            	if (value != null)
						            	{
							            	graph.setCellStyles(mxConstants.STYLE_SPACING_LEFT, value);
							            }
						            }
						        },
						        '-',
				                {
						            text: 'ȫ��',
						            handler: function()
						            {
						            	var value = '0';
						            	var state = graph.getView().getState(graph.getSelectionCell());
						            	
						            	if (state != null)
						            	{
						            		value = state.style[mxConstants.STYLE_SPACING] || value;
						            	}

					            		value = mxUtils.prompt('�������� ����λ���أ�', value);
							            	
						            	if (value != null)
						            	{
							            	graph.setCellStyles(mxConstants.STYLE_SPACING, value);
							            }
						            }
				                },
				                '-',
						        {
						            text: '��Դ���',
						            handler: function()
						            {
						            	var value = '0';
						            	var state = graph.getView().getState(graph.getSelectionCell());
						            	
						            	if (state != null)
						            	{
						            		value = state.style[mxConstants.STYLE_SOURCE_PERIMETER_SPACING] || value;
						            	}
	
					            		value = mxUtils.prompt('��������Դ��� ����λ���أ�', value);
							            	
						            	if (value != null)
						            	{
							            	graph.setCellStyles(mxConstants.STYLE_SOURCE_PERIMETER_SPACING, value);
							            }
						            }
						        },
								{
						            text: 'Ŀ����',
						            handler: function()
						            {
						            	var value = '0';
						            	var state = graph.getView().getState(graph.getSelectionCell());
						            	
						            	if (state != null)
						            	{
						            		value = state.style[mxConstants.STYLE_TARGET_PERIMETER_SPACING] || value;
						            	}
	
					            		value = mxUtils.prompt('������Ŀ���� ����λ���أ�', value);
							            	
						            	if (value != null)
						            	{
							            	graph.setCellStyles(mxConstants.STYLE_TARGET_PERIMETER_SPACING, value);
							            }
						            }
						        },
						        '-',
						        {
						            text: '�ܱ�',
						            handler: function()
						            {
						            	var value = '0';
						            	var state = graph.getView().getState(graph.getSelectionCell());
						            	
						            	if (state != null)
						            	{
						            		value = state.style[mxConstants.STYLE_PERIMETER_SPACING] || value;
						            	}

					            		value = mxUtils.prompt('�������ܳ���� ����λ���أ�', value);
							            	
						            	if (value != null)
						            	{
							            	graph.setCellStyles(mxConstants.STYLE_PERIMETER_SPACING, value);
							            }
						            }
						        }]
							}
						},
						{
							text:'����',
							menu:
							{
				                items: [
				                {
						            text: '����',
						            scope:this,
						            handler: function()
						            {
						                graph.setCellStyles(mxConstants.STYLE_DIRECTION, mxConstants.DIRECTION_NORTH);
						            }
						        },
						        {
						            text: '����',
						            scope:this,
						            handler: function()
						            {
						                graph.setCellStyles(mxConstants.STYLE_DIRECTION, mxConstants.DIRECTION_EAST);
						            }
						        },
						        {
						            text: '����',
						            scope:this,
						            handler: function()
						            {
						                graph.setCellStyles(mxConstants.STYLE_DIRECTION, mxConstants.DIRECTION_SOUTH);
						            }
						        },
						        {
						            text: '����',
						            scope:this,
						            handler: function()
						            {
						                graph.setCellStyles(mxConstants.STYLE_DIRECTION, mxConstants.DIRECTION_WEST);
						            }
						        },
						        '-',
						        {
						            text:'��ת',
						            scope:this,
						            handler: function()
						            {
						            	var value = '0';
						            	var state = graph.getView().getState(graph.getSelectionCell());
						            	
						            	if (state != null)
						            	{
						            		value = state.style[mxConstants.STYLE_ROTATION] || value;
						            	}

					            		value = mxUtils.prompt('������ת�Ƕ� (0-360)', value);
							            	
						            	if (value != null)
						            	{
							            	graph.setCellStyles(mxConstants.STYLE_ROTATION, value);
							            }
						            }
						        }]
							}
						},
				        '-',
				        {
				            text:'Բ��',
				            scope:this,
				            handler: function()
				            {
				               graph.toggleCellStyles(mxConstants.STYLE_ROUNDED);
				            }
				        },
				       	{
				            text:'��ʽ',
				            scope:this,
				            handler: function()
				            {
				        		var cells = graph.getSelectionCells();

								if (cells != null &&
									cells.length > 0)
								{
									var model = graph.getModel();
									var style = mxUtils.prompt('��������ʽ', model.getStyle(cells[0]) || '');
				
									if (style != null)
									{
										graph.setCellStyle(style, cells);
									}
								}
				            }
				        }]
		            }
              	},
              	{
              		split:true,
		            text:'��״',
		            handler: function() { },
		            menu:
		            {
		                items: [
		                {
		                    text:'����ͼ',
		                    iconCls: 'home-icon',
		                    disabled: graph.view.currentRoot == null,
		                    scope: this,
		                    handler:function()
		                    {
		                    	graph.home();
		                    }
		              	},
		              	'-',
		                {
		                    text:'�˳����',
		                    iconCls:'up-icon',
		                    disabled: graph.view.currentRoot == null,
		                    scope: this,
		                    handler:function()
		                    {
		                    	graph.exitGroup();
		                    }
		              	},
		                {
		                    text:'�������',
		                    iconCls:'down-icon',
		                    disabled: !selected,
		                    scope: this,
		                    handler:function()
		                    {
		                    	graph.enterGroup();
		                    }
		              	},
				        '-',
                        {
				            text:'���',
				            icon: 'images/group.gif',
				            disabled: graph.getSelectionCount() <= 1,
				            scope:this,
				            handler: function()
				            {
				                graph.setSelectionCell(graph.groupCells(null, 20));
				            }
				        },
				        {
				            text:'ȡ�����',
				            icon: 'images/ungroup.gif',
				            scope:this,
				            handler: function()
				            {
				        		graph.setSelectionCells(graph.ungroupCells());
				            }
				        },
				        '-',
				       	{
				            text:'��������Ƴ�',
				            scope:this,
				            handler: function()
				            {
				                graph.removeCellsFromParent();
				            }
				        },
				       	{
				            text:'������ϱ߽�',
				            scope:this,
				            handler: function()
				            {
				        		graph.updateGroupBounds(null, 20);
				            }
				        },
		              	'-',
						{
		                    text:'����',
		                    iconCls:'collapse-icon',
		                    disabled: !selected,
		                    scope: this,
		                    handler:function()
		                    {
		                    	graph.foldCells(true);
		                    }
		              	},
		                {
		                    text:'չ��',
		                    iconCls:'expand-icon',
		                    disabled: !selected,
		                    scope: this,
		                    handler:function()
		                    {
		                    	graph.foldCells(false);
		                    }
		              	},
		              	'-',
		                {
				            text:'���ڵײ�',
				            icon: 'images/toback.gif',
				            scope:this,
				            handler: function()
				            {
				                graph.orderCells(true);
				            }
				        },
				        {
				            text:'���ڶ���',
				            icon: 'images/tofront.gif',
				            scope:this,
				            handler: function()
				            {
				                graph.orderCells(false);
				            }
				        },
				        '-',
				        
				        
				        {
							text:'����',
							menu:
							{
								items: [
								{
						            text: '�����',
						            icon: 'images/alignleft.gif',
						            handler: function()
						            {
										graph.alignCells(mxConstants.ALIGN_LEFT);
						            }
						        },
						        {
						            text: '���ж���',
						            icon: 'images/aligncenter.gif',
						            handler: function()
						            {
						        		graph.alignCells(mxConstants.ALIGN_CENTER);
						            }
						        },
						        {
						            text: '�Ҷ���',
						            icon: 'images/alignright.gif',
						            handler: function()
						            {
						        		graph.alignCells(mxConstants.ALIGN_RIGHT);
						            }
						        },
						        '-',
						        {
						            text: '���˶���',
						            icon: 'images/aligntop.gif',
						            handler: function()
						            {
						        		graph.alignCells(mxConstants.ALIGN_TOP);
						            }
						        },
						        {
						            text: '��ֱ����',
						            icon: 'images/alignmiddle.gif',
						            handler: function()
						            {
						        		graph.alignCells(mxConstants.ALIGN_MIDDLE);
						            }
						        },
						        {
						            text: '�׶˶���',
						            icon: 'images/alignbottom.gif',
						            handler: function()
						            {
						        		graph.alignCells(mxConstants.ALIGN_BOTTOM);
						            }
						        }]
							}
						},
				        '-',
				       	{
				            text:'�Զ���С',
				            scope:this,
				            handler: function()
				            {
				            	if (!graph.isSelectionEmpty())
				            	{
				            		graph.updateCellSize(graph.getSelectionCell());
				            	}
				            }
				        }]
		            }
			    },
			    '-',
		       	{
		            text:'�༭',
		            scope:this,
		            handler: function()
		            {
		                graph.startEditing();
		            }
		        },
			    '-',
                {
                    text:'ѡ����״',
                    scope: this,
                    handler:function()
                    {
			    		graph.selectVertices();
                    }
              	},
              	{
                    text:'ѡ��������',
                    scope: this,
                    handler:function()
                    {
              			graph.selectEdges();
                    }
              	},
              	'-',
              	{
                    text:'ѡ��ȫ��',
                    scope: this,
                    handler:function()
                    {
                    	graph.selectAll();
                    }
              	}]
            });
	            
            this.menu.on('hide', this.onContextHide, this);
            this.menu.showAt([e.clientX, e.clientY]);
	    },
	
	    onContextHide : function()
	    {
	        if(this.ctxNode)
	        {
	            this.ctxNode.ui.removeClass('x-node-ctx');
	            this.ctxNode = null;
	        }
	    }
    });

    MainPanel.superclass.constructor.call(this,
    {
        region:'center',
        layout: 'fit',
        items: this.graphPanel
    });

    // Redirects the context menu to ExtJs menus
    graph.panningHandler.popup = mxUtils.bind(this, function(x, y, cell, evt)
    {
    	this.graphPanel.onContextMenu(null, evt);
    });

    graph.panningHandler.hideMenu = mxUtils.bind(this, function()
    {
		if (this.graphPanel.menuPanel != null)
    	{
			this.graphPanel.menuPanel.hide();
    	}
    });

    // Fits the SVG container into the panel body
    this.graphPanel.on('resize', function()
    {
        graph.sizeDidChange();
    });
};

Ext.extend(MainPanel, Ext.Panel);
