$(document).on('turbolinks:load', function() {
  $("input[type='checkbox']").on('click', function(e){
		//var isChecked = $(this).is(":checked");
		//console.log(isChecked);
		$(this).closest('form').submit();
	});

	if (Modernizr.draganddrop) {
  	var dragSrcEl = null;

		function handleDragStart(e) {
		  this.style.opacity = '0.4';  // this / e.target is the source node.
		  dragSrcEl = this;
		  e.dataTransfer.effectAllowed = 'move';
		  e.dataTransfer.setData('text/html', this.innerHTML);
		}

		function handleDragOver(e) {
		  if (e.preventDefault) {
		    e.preventDefault(); // Necessary. Allows us to drop.
		  }

		  e.dataTransfer.dropEffect = 'move';  // See the section on the DataTransfer object.

		  return false;
		}

		function handleDragEnter(e) {
		  // this / e.target is the current hover target.
		  this.classList.add('over');
		}

		function handleDragLeave(e) {
		  this.classList.remove('over');  // this / e.target is previous target element.
		}

		function handleDrop(e) {
		  // this/e.target is current target element.

		  if (e.stopPropagation) {
		    e.stopPropagation(); // Stops some browsers from redirecting.
		  }

		  // Don't do anything if dropping the same column we're dragging.
		  if (dragSrcEl != this) {
		    // Set the source column's HTML to the HTML of the column we dropped on.
		    dragSrcEl.innerHTML = this.innerHTML;
		    this.innerHTML = e.dataTransfer.getData('text/html');
		  }

		  return false;
		}

		function handleDragEnd(e) {
		  // this/e.target is the source node.

		  [].forEach.call(tasks, function (task) {
		    task.classList.remove('over');
		  });

		  this.style.opacity = '1';
		}

		var tasks = document.querySelectorAll('#movable .task');

		[].forEach.call(tasks, function(task) {
		  task.addEventListener('dragstart', handleDragStart, false);
		  task.addEventListener('dragstart', handleDragStart, false);
		  task.addEventListener('dragenter', handleDragEnter, false);
		  task.addEventListener('dragover', handleDragOver, false);
		  task.addEventListener('dragleave', handleDragLeave, false);
		  task.addEventListener('drop', handleDrop, false);
			task.addEventListener('dragend', handleDragEnd, false);
		});
	}
	else {
	  // Fallback to a library solution.
	}
});


