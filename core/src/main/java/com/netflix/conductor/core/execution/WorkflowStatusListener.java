package com.netflix.conductor.core.execution;

import com.netflix.conductor.common.run.Workflow;

/**
 * Default implementation to be overridden if needed
 *
 */
public interface WorkflowStatusListener {
    void onWorkflowCompleted(Workflow workflow);
    void onWorkflowTerminated(Workflow workflow);
    void onWorkflowPaused(Workflow workflow);
}
